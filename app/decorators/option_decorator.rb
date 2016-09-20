class OptionDecorator < Draper::Decorator
  include AnswerSessionContextualised

  def label
    interpolate object.label
  end

  def value
    object.value
  end
end
