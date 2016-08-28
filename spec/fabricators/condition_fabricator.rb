Fabricator(:condition) do
  source { Fabricate(:boolean_question) }
  conditional { Fabricate(:boolean_question) }  
end
