class Spinach::Features::IsomorphicComponents < Spinach::FeatureSteps
  step 'I have JavaScript switched on' do
    # Handled by @javascript tag
  end

  step 'I have JavaScript switched off' do
    # Handled by absence of @javascript tag
  end

  step 'I browse to the Hello page' do
    visit '/hello'
  end

  step 'I should see a greeting' do
    expect(page).to have_css ".greeting"
  end

  step 'it should say hello' do
    expect(page).to have_content 'hello'
  end
end
