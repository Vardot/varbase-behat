Feature: Check the inbox for emails using the testing@vardot.com email

  @javascript
  Scenario: Login to the testing@vardot.com email.
    Given I go to "https://accounts.google.com" website
     When I fill in "testing@vardot.com" for "Email"
      And I press "Next"
     Then I should see "Sign in with your Google Account "
     When I fill in "thePassword" for "Password"
      And I press "Sign in"
     Then I should see "Welcome"
