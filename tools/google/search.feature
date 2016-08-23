Feature: Search google

  @javascript
  Scenario: To search in Google about Varbase.
    Given I go to "http://google.com" website
     When I click "استخدام Google.com"
      And wait
     Then I should see "Google"
     When I fill in "Varbase" for "q"
      And I press "Search"
      And wait for 10s
     Then I should see "About 316,000 results"
      And I wait 20s
