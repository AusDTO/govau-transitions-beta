class AnswersController < ApplicationController
  before_action :set_question

  def create
    answer_session = answer_session_for @question.wizard
    answer_session.answers.where(question_id: @question.id).destroy_all

    [*params[:answer][:options]].each do |value|
      answer_session.answers.create question_id: @question.id, value: value
    end

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
    @wizard = @question.wizard
  end
end
