class Spinach::Features::IsomorphicComponents < Spinach::FeatureSteps
  step 'I have JavaScript switched on' do
    # Handled by @javascript tag
  end

  step 'I have JavaScript switched off' do
    # Handled by absence of @javascript tag
  end

  step 'I browse to the Hello page' do
    visit '/'
  end

  step 'I should see a welcome message' do
    expect(page).to have_content 'Welcome to Transitions Beta!'
  end

end
