module AnswerSessionContextualised
  def interpolate(str)
    answer_session&.interpolate(str) || str
  end

  private

  def answer_session
    context[:answer_session]
  end

  def answer_session_context
    { context: { answer_session: answer_session } }
  end
end
