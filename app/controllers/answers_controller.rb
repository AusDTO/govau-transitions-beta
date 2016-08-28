class AnswersController < ApplicationController
  before_action :set_question

  def create
    answer = current_user.answers.find_or_create_by(question_id: @question.id)
    answer.update_attribute :value, params[:answer][:options]
    next_question = @question.next_question current_user.answers

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
