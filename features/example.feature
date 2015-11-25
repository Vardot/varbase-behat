Feature: Example

  Scenario: Go to about page with no visual view.
    Given I go to "https://www.vardot.com" website
     When I click "About"
      And wait
     Then I should see "the team"

  @mink:selenium2
  Scenario: Go to about page using mink selenium2
     Given I go to "https://www.vardot.com" website
      When I click "About"
       And wait
      Then I should see "the team"

  @javascript
  Scenario: To search in Google about Varbase.
    Given I go to "https://www.vardot.com" website
     When I click "About"
      And wait
     Then I should see "the team"
