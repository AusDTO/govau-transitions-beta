class Wizard < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :questions
  has_many :results

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  def results_for(answers)
    results.select do |result|
      result.visible_given_answers? answers
    end
  end
end
``
