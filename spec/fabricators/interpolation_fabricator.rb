Fabricator(:interpolation) do
  wizard
  source { Fabricate(:single_choice_question) }
  name { sequence(:interpolation_name) { |i| "interpolation-#{i}" } }
end
