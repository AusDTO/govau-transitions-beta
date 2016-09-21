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

  def interpolate(text)
    wizard.interpolations.inject(text) do |str, interpolation|
      interpolation.invoke str, self
    end
  end

  def question_after(question)
    visible_questions[index_of(question) + 1]
  end

  def question_before(question)
    idx = index_of question
    visible_questions[idx - 1] if idx > 0
  end

  def results(for_container: nil)
    wizard.results.select do |result|
      if for_container.nil? || result.container == for_container
        result.visible_given_answers? answers
      end
    end
  end

  def result_categories
    results.collect {|result|
      result.result_category
    }.uniq.reject(&:blank?)
  end

  def result_groups(for_category: nil)
    results.collect {|result|
      result.result_group
    }.uniq.select {|result_group|
      for_category.nil? || for_category == result_group.result_category
    }
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
