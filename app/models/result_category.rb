class ResultCategory < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :wizard
  has_many :result_groups
  has_many :results, as: :container
  has_many :grouped_results, class_name: 'Result', through: :result_groups

  validates :wizard, presence: true
  validates :slug, presence: true, uniqueness: { scope: :wizard_id }
end
