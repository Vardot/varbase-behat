Feature: Check the inbox for emails using the testing@vardot.com email

  @javascript
  Scenario: Login to the testing@vardot.com email.
    Given I go to "https://accounts.google.com" website
     When I fill in "testing@vardot.com" for "Email"
      And I press "Next"
     Then I should see "Sign in with your Google Account "
     When I fill in "The Passwordd for the testing Email" for "Passwd"
      And I press "Sign in"
      And I wait for "5 secounds"
      And I go to "https://mail.google.com/mail/u/0/#inbox"
     Then I should see "Inbox"
      And I wait for "10 secounds"
