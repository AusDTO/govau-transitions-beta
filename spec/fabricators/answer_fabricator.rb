Fabricator(:answer) do
  owner { Fabricate(:answer_session) }
  question { Fabricate(:single_choice_question) }
  value { 'foo' }
end
