Feature: Isomorphic components

  Scenario: JS-enabled client
    Given I have JavaScript switched on
    When I browse to the Hello page
    Then I should see a greeting
    And it should greet me as Stranger

  @javascript
  Scenario: JS-disabled client
    Given I have JavaScript switched off
    When I browse to the Hello page
    Then I should see a greeting
    And it should greet me as Stranger
