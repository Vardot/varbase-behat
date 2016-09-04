Feature: User Management - Standard User Management - Request new password
As a user with a ready user account
I will want to be able to Request new password
So that I can reset my password for the account

  Background: 
    Given I am not logged in
  
  @local @development @staging @production
  Scenario: Check if a non logged in users can reset their passwords.
     When I go to "/user/login"
      And I wait
     Then I should see "Request new password"
  
  @local @development @staging @production
  Scenario: Check if the email has been used to rest the password is not existing email.
     When I go to "/user/password"
      And I wait
     Then I should see "User Account"
     When I fill in "not.existing.email@vardot.com" for "Username or e-mail address *"
      And I press the "E-mail new password" button
      And I wait
     Then I should see "Further instructions have been sent to your e-mail address."
