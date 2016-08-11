Fabricator(:wizard) do
  name { sequence(:wizard_name) { |i| "Wizard #{i}" } }
end
