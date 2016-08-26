class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :owner, polymorphic: true

  validates :value, presence: true
  validates :owner, presence: true
  validates :question, presence: true
  validates :question_id, uniqueness: { scope: [:owner_type, :owner_id] }

  scope :to_question, ->(question) { where question_id: question.id }
end
