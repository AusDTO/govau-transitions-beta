class Spinach::Features::RealQuestions < Spinach::FeatureSteps
  include SharedSteps::WizardSteps

  step 'there is a wizard for getting older' do
    require './db/seeds'
  end

  step 'I am Lily' do
    # Sugar
  end

  step 'I browse to the Help For Older People wizard page' do
    @wizard_page = Pages::Wizard.new
    @wizard_page.load slug: 'helping-older-australians'
  end

  step 'I should be asked whether I am looking for myself or someone else' do
    expect_prompt 'Are you looking for yourself or someone else?'
  end

  step 'I answer myself' do
    choose_answer 'Myself'
  end

  step 'I should be asked how old I am' do
    expect_prompt 'How old are you?'
  end

  step 'I answer 72' do
    choose_answer '65 to 79'
  end

  step 'I should be asked about my current need' do
    expect_prompt 'Which best describes your current need?'
  end

  step 'I answer that I\'m thinking about the future' do
    choose_answer 'I\'m thinking about the future'
  end

  step 'I should be asked what support I\'m interested in' do
    expect_prompt 'What support are you interested in learning about?'
  end

  step 'I answer help at home' do
    choose_answer 'Help at home'
  end

  step 'I answer health conditions' do
    choose_answer 'Health conditions'
  end

  step 'I should be asked about physical issues' do
    expect_prompt 'Are you concerned about any of these health issues?'
  end

  step 'I answer incontinence' do
    choose_answer 'Incontinence'
  end

  step 'I answer dementia' do
    choose_answer 'Dementia'
  end

  step 'I should be asked about emotional issues' do
    expect_prompt 'Are you concerned about any of these emotional issues?'
  end

  step 'I answer anxiety' do
    choose_answer 'Anxiety'
  end

  step 'I should be asked what help is needed at home' do
    expect_prompt 'What help is needed at home?'
  end

  step 'I answer personal hygiene' do
    choose_answer 'Personal hygiene'
  end

  step 'I should see the results overview page' do
    @results_page = Pages::Result.new
    expect(@results_page.heading.text).to eq 'Explore your results'
  end

  step 'it should have two result category tiles' do
    expect(@results_page).to have_tiles
    expect(@results_page.tiles.count).to eq 2
  end

  step 'I click the help at home tile' do
    @results_page.tile_for_category('Help at home').link.click
  end

  step 'I should arrive at the help at home result page' do
    expect(@results_page.heading.text).to eq 'Help at home'
  end

  step 'it should have general information about help at home' do
    expect(@results_page.description.text).to include(
      'Get the help and advice you need to stay in your home')
  end

  step 'I should see two possible next steps' do
    expect(@results_page.group_count.text).to eq '2'
  end

  step 'I should see a block for getting home help' do
    @ghh = @results_page.block_for_group('Getting home help')
    expect(@ghh).to be_present
  end

  step 'the getting home help block should have brief info on getting assessed' do
    expect(@ghh.body.text).to include 'You can arrange for an assessor to visit you'
  end

  step 'the getting home help block should have a link for being assessed' do
    expect(@ghh.result_with_content 'Being assessed for support').to be_present
  end

  step 'I should see a block for arranging an assessment' do
    @aaa = @results_page.block_for_group('Arrange for an assessment')
    expect(@aaa).to be_present
  end

  step 'the arranging an assessment block should have some basic info on arranging an assessment' do
    expect(@aaa.body.text).to include 'If you would like an assessment in your home'
  end

  step 'the arranging an assessment block should have the My Aged Care phone number' do
    expect(@aaa.result_with_content 'Call: 1800 200 422').to be_present
  end

  step 'there should be an ungrouped result for SA local homes and community services' do
    expect(@results_page.ungrouped_result_containing_text(
      'Find a local home')).to be_present
  end

  step 'there should be an ungrouped result for SA hospitals and health services' do
    expect(@results_page.ungrouped_result_containing_text(
      'Find hospitals and health services')).to be_present
  end

  step 'there should be an ungrouped result for the Fight Dementia website' do
    expect(@results_page.ungrouped_result_containing_text(
      'fight dementia website')).to be_present
  end

  step 'I should see a block for fee estimation' do
    pending 'step not implemented'
  end

  step 'the fee estimation block should have some basic info' do
    pending 'step not implemented'
  end

  step 'the fee estimation block should link to My Aged Care estimation form' do
    pending 'step not implemented'
  end

  step 'the fee estimation block should have a link to choosing a care provider' do
    pending 'step not implemented'
  end

  step 'I should see a local services block' do
    pending 'step not implemented'
  end

  step 'the local services block should link to My Aged Care providers' do
    pending 'step not implemented'
  end

  step 'I should see a further information block' do
    pending 'step not implemented'
  end

  step 'the further information block should link to SA Health service providers' do
    pending 'step not implemented'
  end

  step 'there should be a menu to navigate to other results' do
    pending 'step not implemented'
  end

  step 'I click in the result nav menu on health and wellbeing' do
    pending 'step not implemented'
  end

  step 'I should arrive at the health and wellbeing result page' do
    pending 'step not implemented'
  end

  step 'it should have general information about health and wellbeing' do
    pending 'step not implemented'
  end

  step 'I should see four possible next steps' do
    pending 'step not implemented'
  end

  step 'I should see a block for dementia hotline' do
    pending 'step not implemented'
  end

  step 'I should see a block for support with continence at a state level' do
    pending 'step not implemented'
  end

  step 'I should see a block for support with continence at a national level' do
    pending 'step not implemented'
  end

  step 'I should see a block for incontinence advice' do
    pending 'step not implemented'
  end
end
