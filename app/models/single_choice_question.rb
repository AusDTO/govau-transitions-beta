class SingleChoiceQuestion < Question

  # Convenience for creating a boolean question, e.g.:
  # SingleChoiceQuestion.new prompt: 'Do you like...mantronix?'
  BOOLEAN_OPTIONS = %w(Yes No).collect do |bool|
    { value: bool.downcase, label: bool }
  end

  store_attributes :meta do
    options Array[Option]
  end
end
