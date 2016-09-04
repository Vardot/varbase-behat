Feature: User Management - Standard User Management - Admins can create users and assign a role to them
As a site admin user
I want to be able create new user accounts and assign roles to them
So that they will be able to use the site.

  Background: 
    Given I am a logged in user with the "webmaster" user
  
  @javascript @local @development @staging @production
  Scenario: Check if admins can see "Add user" button under people administration.
    Given I go to "/admin/people"
     When I click "Add user"
      And I should see "People"
      And I should see "Username"
      And I should see "E-mail address"
  
  @javascript @local @development @staging @production
  Scenario: Check if admins can create new user account as an (authenticated user)
    Given I go to "/admin/people/create"
     When I fill in "Tester" for "Username"
      And I fill in "tester@vardot.com" for "E-mail address"
      And I press "Create new account"
     Then I should see "Since you did not provide a password, it was generated automatically for this account."
      And I should see "Created a new user account for Tester. No e-mail has been sent."
     When I go to "/admin/people"
      And I fill in "Tester" for "Username"
      And I press "Apply"
      And I wait
     Then I should see "Tester"
     When I click "Tester"
      And I wait
     Then I should see "History"
     When I click "Edit"
      And I fill in "dD.123123" for "Password"
      And I fill in "dD.123123" for "Confirm password"
     Then I press "Save"
  
  @javascript @local @development @staging @production
  Scenario: Delete the test_authenticated user.
     When I go to "/admin/people"
      And I fill in "Tester" for "Username"
      And I press "Apply"
      And wait
     Then I should see "Tester"
     When I click "Tester"
      And wait
     Then I should see "History"
     When I click "Edit"
      And wait
      And I press "Cancel account"
      And wait
     Then I should see "Are you sure you want to cancel the account Tester?"
     When I select the radio button "Delete the account and its content."
      And I press "Cancel account"
      And wait
     Then I should see "Tester has been deleted."
  
