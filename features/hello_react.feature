Feature: Isomorphic components

  Scenario: JS-disabled client
    Given I have JavaScript switched on
    When I browse to the Hello page
    Then I should see a greeting
    And it should say hello

  @javascript
  Scenario: JS-enabled client
    Given I have JavaScript switched off
    When I browse to the Hello page
    Then I should see a greeting
    And it should say hello
