class SingleChoiceQuestion < Question
  include Choosable

  # Convenience for creating a boolean question, e.g.:
  # SingleChoiceQuestion.new options: SingleChoiceQuestion::BOOLEAN_OPTIONS,
  #   prompt: 'Do you like...mantronix?'
  BOOLEAN_OPTIONS = Option.quick_list 'Yes', 'No'

  def multiple_choice?
    false
  end
end
