Feature: Search google

  @javascript
  Scenario: To search in Google about Varbase.
    Given I go to "http://google.com" website
     When I click "استخدام Google.com"
     Then I should see "Google"
     When I fill in "Varbase" for "q"
      And I press "Search"
      And I wait for the page
     Then I should see "Varbase: Drupal Bundled with Necessities | by Vardot ..."
      And I wait for "10" seconds
