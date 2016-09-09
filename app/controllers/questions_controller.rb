class QuestionsController < ApplicationController
  def show
    @question = Question.find params[:id]
    @wizard = @question.wizard
  end
end
