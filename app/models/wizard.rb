class Wizard < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :questions

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true
end
