class Spinach::Features::IsomorphicComponents < Spinach::FeatureSteps
  step 'I have JavaScript switched on' do
    # Handled by @javascript tag
  end

  step 'I have JavaScript switched off' do
    # Handled by absence of @javascript tag
  end

  step 'I browse to the Hello page' do
    visit '/hello_world'
  end

  step 'I should see a greeting' do
    expect(page).to have_content 'Hello,'
  end

  step 'it should greet me as Stranger' do
    expect(page).to have_content 'Stranger'
  end
end
