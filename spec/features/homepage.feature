@javascript
Feature: Visit homepage
  Background:
    Given there is a todo item with action "learn something"

  Scenario: visit homepage
    When I visit it
    Then it should show todo item with action "learn something"