class ResultCategoryDecorator < Draper::Decorator
  include AnswerSessionContextualised
  delegate_all

  def result_groups
    if answer_session.present?
      answer_session.result_groups(for_category: object).decorate(
        answer_session_context)
    else
      object.result_groups.decorate
    end
  end
end
