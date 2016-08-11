Fabricator(:question) do
  wizard
  prompt { sequence(:question_prompt) { |i| "Question #{i}" } }
end
