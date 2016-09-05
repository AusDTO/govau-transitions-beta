class AnswerSession < ApplicationRecord
  has_secure_token

  belongs_to :wizard
  has_many :answers, as: :owner

  def answer_for(question)
    answers.find_by question_id: question.id
  end

  def index_of(question)
    visible_questions.each_with_index do |each_question, idx|
      return idx if question == each_question
    end

    raise 'Not a visible question'
  end

  def question_after(question)
    visible_questions[index_of(question) + 1]
  end

  def question_before(question)
    idx = index_of question
    visible_questions[idx - 1] if idx > 0
  end

  def visible_questions
    @visible_questions ||= select_visible_questions
  end

  private

  def select_visible_questions
    wizard.questions.ordered.to_a.select do |question|
      question.visible_given_answers? self.answers
    end
  end
end
