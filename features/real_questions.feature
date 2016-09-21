@isolate
Feature: Real questions
  So that I can find out about getting older
  As an older person or someone supporting them
  I want to find information relevant to me

  Background:
    Given there is a wizard for getting older

  Scenario: Lily
    Given I am Lily
    When I browse to the Help For Older People wizard page
    And I begin the wizard
    Then I should be asked whether I am looking for myself or someone else
    When I answer myself
    And I proceed
    Then I should be asked about my current need
    When I answer that I'm thinking about the future
    And I proceed
    Then I should be asked what support I'm interested in
    When I answer help at home
    And I answer health conditions
    And I answer transport
    And I proceed
    Then I should be asked about health conditions
    When I answer incontinence
    And I answer dementia
    And I proceed
    Then I should be asked about emotional issues
    When I answer anxiety
    And I proceed
    Then I should be asked what help is needed at home
    And I answer personal hygiene
    And I answer housework
    And I proceed
    Then I should see the results overview page
    And it should have two result category tiles
    When I click the help at home tile
    Then I should arrive at the help at home result page
    And it should have general information about help at home
    And I should see two possible next steps
    And I should see a block for getting home help
    And the getting home help block should have brief info on getting assessed
    And the getting home help block should have a link for being assessed
    And I should see a block for arranging an assessment
    And the arranging an assessment block should have some basic info on arranging an assessment
    And the arranging an assessment block should have the My Aged Care phone number
    And I should see a block for choosing a service provider
    And the choosing a service provider help block should have some basic info
    And the choosing a service provider help block should have a comparison link

    And there should be an ungrouped result for SA local homes and community services
    And there should be an ungrouped result for SA hospitals and health services
    And there should be an ungrouped result for the Fight Dementia website


    And I should see a block for fee estimation
    And the fee estimation block should have some basic info
    And the fee estimation block should link to My Aged Care estimation form
    And the fee estimation block should have a link to choosing a care provider
    And I should see a local services block
    And the local services block should link to My Aged Care providers
    And I should see a further information block
    And the further information block should link to SA Health service providers
    And there should be a menu to navigate to other results
    When I click in the result nav menu on health and wellbeing
    Then I should arrive at the health and wellbeing result page
    And it should have general information about health and wellbeing
    And I should see four possible next steps
    And I should see a block for dementia hotline
    And I should see a block for support with continence at a state level
    And I should see a block for support with continence at a national level
    And I should see a block for incontinence advice
    And I should see a local services block
    And I should see a further information block
