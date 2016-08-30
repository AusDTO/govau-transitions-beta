class MultipleChoiceQuestion < Question
  include Choosable

  def multiple_choice?
    true
  end
end
