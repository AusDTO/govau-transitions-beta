Fabricator(:question) do
  wizard
  prompt { sequence(:question_prompt) { |i| "Question #{i}" } }
end

Fabricator(:single_choice_question, from: :question,
    class_name: :single_choice_question) do
  options { %w(foo bar foobar).collect {|word| { value: word, label: word } } }
end

Fabricator(:multiple_choice_question, from: :single_choice_question,
    class_name: :multiple_choice_question) do
end

Fabricator(:boolean_question, from: :single_choice_question) do
  options { SingleChoiceQuestion::BOOLEAN_OPTIONS }
end
