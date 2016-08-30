Fabricator(:answer) do
  owner { Fabricate(:session_user) }
  question { Fabricate(:single_choice_question) }
  value { 'foo' }
end
