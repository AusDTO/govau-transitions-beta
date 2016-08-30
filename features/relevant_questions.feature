Feature: Relevant questions
  In order quickly to find out information
  As a citizen contemplating a transition
  I want only to see questions relevant to my situation

  Background:
    Given phoenixes have a twelve-month regeneration cycle
    And their regeneration is dangerous for their surroundings
    And they care

  Scenario: End of regeneration cycle in a log cabin
    Given I am a phoenix about to burst into flame
    And I am in a log cabin
    When I browse to the Phoenix Regeneration page
    And I begin the wizard
    Then I should be asked how many months it has been since my last regeneration
    When I answer twelve months
    And I proceed
    Then I should be asked if I am near flammable objects
    When I answer yes
    And I proceed
    Then I should be advised to move location

  Scenario: Middle of regeneration cycle in a log cabin
    Given I am a phoenix not about to burst into flame
    And I am in a log cabin
    When I browse to the Phoenix Regeneration page
    And I begin the wizard
    Then I should be asked how many months it has been since my last regeneration
    When I answer six months
    And I proceed
    Then I should be advised to check back closer to the time

  Scenario: End of regeneration cycle on a rock
    Given I am a phoenix about to burst into flame
    And I am perching on a rock
    When I browse to the Phoenix Regeneration page
    And I begin the wizard
    Then I should be asked how many months it has been since my last regeneration
    When I answer twelve months
    And I proceed
    Then I should be asked if I am near flammable objects
    When I answer no
    And I proceed
    Then I should be advised to sit tight and stay calm
