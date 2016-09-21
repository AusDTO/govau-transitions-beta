class QuestionDecorator < Draper::Decorator
  include AnswerSessionContextualised
  delegate_all

  def options
    object.options.collect do |option|
      option.decorate answer_session_context
    end
  end

  def prompt
    interpolate object.prompt
  end
end
