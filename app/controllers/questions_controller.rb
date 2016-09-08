class QuestionsController < ApplicationController
  def show
    @question = Question.find params[:id]
    @wizard = @question.wizard
    @widget_properties = {
      :question => @question.slice(:id, :prompt, :options),
      :form => {
        :action => question_answers_path(question_id: @question.id)
      }
    }
  end
end
