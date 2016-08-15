class Spinach::Features::RelevantQuestions < Spinach::FeatureSteps
  step 'phoenixes have a twelve-month regeneration cycle' do
    @cycle_question = Fabricate :single_choice_question do
      prompt { 'How many months has it been since your last regeneration?' }
      options(count: 13) { |attrs, i| { value: i, label: i.humanize } }
    end

    @about_to_ignite_condition = Fabricate :math_condition do
      source @cycle_question
      operator '>='
      comparator 12
    end

    @not_about_to_ignite_condition = @about_to_ignite_condition.negate
  end

  step 'their regeneration is dangerous for their surroundings' do
    @flammable_question = Fabricate :boolean_question do
      prompt { 'Are you near flammable objects at the moment?' }
      conditions {[ @about_to_ignite_condition ]}
    end
  end

  step 'they care' do
    @check_back_result = Fabricate :simple_result do
      title { 'Safe for now' }
      body { 'Check back in %s months' }
      conditions {[ @not_about_to_ignite_condition ]}
      interpolations {[{ source: @cycle_question,
        transformations: ['12 - %i.to_i', '%i.humanize' ]}]} #TODO security!
    end

    @move_location_result = Fabricate :simple_result do
      title { 'Move away' }
      body { 'To preserve the safety of others around you, go somewhere else' }
      conditions {[ @about_to_ignite_condition, @flammable_question.condition ]}
    end

    @sit_tight_result = Fabricate :simple_result do
      title { 'Sit tight' }
      body { 'Just sit tight and stay calm, regeneration is about to happen' }
      conditions {[ @about_to_ignite_condition,
        @flammable_question.condition.negate ]}
    end

    @wizard = Fabricate :wizard do
      questions {[ @cycle_question, @flammable_question ]}
      results {[ @check_back_result, @move_location_result, @sit_tight_result ]}
    end
  end

  step 'I am a phoenix about to burst into flame' do
    # sugar
  end

  step 'I am in a log cabin' do
    # sugar
  end

  step 'I browse to the Phoenix Regeneration page' do
    @wizard_page = Pages::Wizard.new @wizard.slug
    @wizard_page.load
  end

  step 'I should be asked how many months it has been since my last regeneration' do
    expect(@wizard_page).to have_prompt
    expect(@wizard_page.prompt.text).to eq @cycle_question.prompt
  end

  step 'I answer twelve months' do
    @wizard_page.answer_field.check 'Twelve'
  end

  step 'I should be asked if I am near flammable objects' do
    expect(@wizard_page).to have_prompt
    expect(@wizard_page.prompt).to have_text @flammable_question.prompt
  end

  step 'I answer yes' do
    @wizard_page.answer_field.check 'Yes'
  end

  step 'I should be advised to move location' do
    result_should_have_body @move_location_result.body
  end

  step 'I am a phoenix not about to burst into flame' do
    # sugar
  end

  step 'I answer six months' do
    @wizard_page.answer_field.check 'Six'
  end

  step 'I should be advised to check back in six months' do
    result_should_have_body @check_back_result.body % 'six'
  end

  step 'I am perching on a rock' do
    # sugar
  end

  step 'I answer no' do
    @wizard_page.answer_field.check 'No'
  end

  step 'I should be advised to sit tight and stay calm' do
    result_should_have_body @sit_tight_result.body
  end

  step 'I proceed' do
    @wizard_page.next_button.click
  end

  def result_should_have_body(body)
    @results_page = Pages::ResultSet.new
    expect(@results_page).to be_displayed
    expect(@results_page).to have_body
    expect(@results_page.body).to have_text body
  end
end
