class Spinach::Features::RelevantQuestions < Spinach::FeatureSteps
  include SharedSteps::WizardSteps

  step 'phoenixes have a twelve-month regeneration cycle' do
    @cycle_question = Fabricate(:single_choice_question, wizard: wizard) do
      prompt { 'How many months has it been since your last regeneration?' }
      options(count: 13) { |attrs, i| { value: i, label: i.humanize.capitalize } }
    end
  end

  step 'their regeneration is dangerous for their surroundings' do
    @flammable_question = Fabricate(:boolean_question, wizard: wizard) do
      prompt { 'Are you near flammable objects at the moment?' }
    end

    about_to_ignite_condition @flammable_question
  end

  step 'they care' do
    @check_back_result = Fabricate(:simple_result, wizard: wizard) do
      title 'Safe for now'
      body 'Check back close to the time of your next regeneration'
    end

    not_about_to_ignite_condition @check_back_result

    @move_location_result = Fabricate(:simple_result, wizard: wizard) do
      title 'Move away'
      body 'To preserve the safety of others around you, go somewhere else'
    end

    about_to_ignite_condition @move_location_result
    near_flammable_condition @move_location_result

    @sit_tight_result = Fabricate(:simple_result, wizard: wizard) do
      title 'Sit tight'
      body 'Just sit tight and stay calm, regeneration is about to happen'
    end

    about_to_ignite_condition @sit_tight_result
    not_near_flammable_condition @sit_tight_result
  end

  step 'I am a phoenix about to burst into flame' do
    # sugar
  end

  step 'I am in a log cabin' do
    # sugar
  end

  step 'I browse to the Phoenix Regeneration page' do
    @wizard_page = Pages::Wizard.new
    @wizard_page.load(slug: @wizard.slug)
  end

  step 'I should be asked how many months it has been since my last regeneration' do
    expect_prompt @cycle_question.prompt
  end

  step 'I answer twelve months' do
    choose_answer 'Twelve'
  end

  step 'I should be asked if I am near flammable objects' do
    expect_prompt @flammable_question.prompt
  end

  step 'I answer yes' do
    choose_answer 'Yes'
  end

  step 'I should be advised to move location' do
    result_should_have_body @move_location_result.body
  end

  step 'I am a phoenix not about to burst into flame' do
    # sugar
  end

  step 'I answer six months' do
    choose_answer 'Six'
  end

  step 'I should be advised to check back closer to the time' do
    result_should_have_body @check_back_result.body
  end

  step 'I am perching on a rock' do
    # sugar
  end

  step 'I answer no' do
    choose_answer 'No'
  end

  step 'I should be advised to sit tight and stay calm' do
    result_should_have_body @sit_tight_result.body
  end

  private

  def result_should_have_body(body)
    @results_page = Pages::Result.new
    results_text = @results_page.orphan_results.collect {|r| r.text}.join
    expect(results_text).to include body
  end

  def near_flammable_condition(for_conditional)
    Fabricate :condition, source: @flammable_question, operator: 'eq',
      comparators: ['yes'], conditional: for_conditional
  end

  def not_near_flammable_condition(for_conditional)
    Fabricate :condition, source: @flammable_question, operator: 'ne',
      comparators: ['yes'], conditional: for_conditional
  end

  def about_to_ignite_condition(for_conditional)
    Fabricate :condition, source: @cycle_question, operator: 'gt',
      comparators: [11], conditional: for_conditional
  end

  def not_about_to_ignite_condition(for_conditional)
    Fabricate :condition, source: @cycle_question, operator: 'lt',
      comparators: [12], conditional: for_conditional
  end

  def wizard
    @wizard ||= Fabricate :wizard
  end
end
