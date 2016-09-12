class QuestionsController < ApplicationController
  def show
    q = Question.find params[:id]
    @question = QuestionDecorator.decorate q, context:
      { answer_session: answer_session_for(q.wizard) }
      
    @wizard = @question.wizard
  end
end
