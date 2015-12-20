Feature: Have a look at some of Vardot's team and personals.
 As a Client
 I want to be able to see some of Vardot's staff
 So that I will have an idea of personals they have

  Scenario: Check the about page.
    Given I go to "https://www.vardot.com" website
     When I click "About"
      And wait
     Then I should see "the team"

   @mink:goutte
   Scenario: Go to about page using goutte. Check if we can use it.
      Given I go to "https://www.vardot.com" website
       When I click "About"
        And wait
       Then I should see "the team"

  @mink:selenium2
  Scenario: Go to about page using mink selenium2. Check if we can use it.
     Given I go to "https://www.vardot.com" website
      When I click "About"
       And wait
      Then I should see "the team"

  @mink:zombie
  Scenario: Go to about page using mink zombie. Check if we can use it.
     Given I go to "https://www.vardot.com" website
      When I click "About"
       And wait
      Then I should see "the team"


  @mink:sahi
  Scenario: Go to about page using mink sahi. Check if we can use it.
     Given I go to "https://www.vardot.com" website
      When I click "About"
       And wait
      Then I should see "the team"

  @javascript
  Scenario: Go to about page using the default javascript_session driver.
    Given I go to "https://www.vardot.com" website
     When I click "About"
      And wait
     Then I should see "the team"
