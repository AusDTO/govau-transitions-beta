class ResultGroupDecorator < Draper::Decorator
  include AnswerSessionContextualised
  delegate_all

  def results
    if answer_session.present?
      answer_session.results(for_container: object)#.decorate(answer_session_context)
    else
      object.results
    end
  end
end
