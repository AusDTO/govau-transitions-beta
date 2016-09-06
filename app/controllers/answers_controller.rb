class AnswersController < ApplicationController
  before_action :set_question

  def create
    answer_session = answer_session_for @question.wizard
    answer = answer_session.answers.find_or_create_by(question_id: @question.id)
    answer.update_attribute :value, params[:answer][:options]
    next_question = answer_session.question_after @question

    if next_question.present?
      redirect_to question_path id: next_question.id
    else
      redirect_to wizard_results_path wizard_id: @question.wizard.slug
    end
  end

  private

  def set_question
    @question = Question.find params[:question_id]
  end
end
