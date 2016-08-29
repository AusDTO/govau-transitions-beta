@isolate
Feature: Real questions
  So that I can find out about getting older
  As an older person or someone supporting them
  I want to find information relevant to me

  Background:
    Given there is a wizard for getting older

  Scenario: Lily
    Given I am Lily
    When I browse to the Getting Older page
    And I begin the wizard
    Then I should be asked whether I am looking for myself or someone else
    When I answer myself
    And I proceed
    Then I should be asked how old I am
    When I answer 72
    And I proceed
    Then I should be asked what best describes my current need
    When I answer that I'm thinking about the future
    And I proceed
    Then I should be asked what support I'm interested in
    When I answer staying at home
    And I proceed
    Then I should be about physical issues
    When I answer incontinence
    And I proceed
    Then I should be asked about emotional issues
    When I answer dementia
    And I proceed
    Then I should be asked what help is needed at home
    When I answer shopping
    And I proceed
    Then I should be asked where I live
    When I answer Morphettvale
    And I proceed
    Then I should be asked what options I want to learn more about
    When I answer helping stay independent
    And I proceed
    Then (...results, TBD)
