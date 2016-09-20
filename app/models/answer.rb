=begin
Answer objects represent users' responses to Questions. If the Question object
to which the Answer belongs is multiple choice (Question#multiple?) then there
can be more than one Answer object belonging to that Question; otherwise, a
maximum of one Answer per Question.

Answer objects are typically owned (Answer#owner) by an AnswerSession object
(it's a polymorphic relationship in case some other strategy for grouping
answers is developed).

Conditionals (e.g. Question, Result) may be shown or hidden depending on the
value of specific Answers. See the Conditional module for more detail.
=end

class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :owner, polymorphic: true

  validates :value, presence: true
  validates :owner, presence: true
  validates :question, presence: true
  validates :question_id, uniqueness: { scope: [:owner_type, :owner_id] },
    unless: -> (a) { a.question&.multiple_choice? }

  scope :to_question, ->(question) { where question_id: question.id }
end
