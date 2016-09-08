class QuestionsController < ApplicationController
  def show
    @question = Question.find params[:id]
    @wizard = @question.wizard
    @props = {
      :currentQuestion => @question,
      :form => {
        :action => question_answers_path(question_id: @question.id),
        :csrf_param => request_forgery_protection_token,
        :csrf_token => form_authenticity_token
      }
    }
  end
end
