Fabricator(:result) do
  wizard
  title { sequence(:result_title) { |i| "Result #{i}" } }
end

Fabricator(:simple_result, from: :result, class_name: :simple_result) do
  body { 'Lorem ipsum dolor sit amet' }
end
