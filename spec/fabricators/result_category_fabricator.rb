Fabricator(:result_category) do
  wizard
  title { sequence(:result_category) { |i| "ResultCategory #{i}" } }
  description 'Lorem ipsum, dolor sit amet'
end
