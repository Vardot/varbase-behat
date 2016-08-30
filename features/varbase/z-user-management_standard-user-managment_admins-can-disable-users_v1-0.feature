Feature: User Management - Standard User Management - Admins can disable users
  As a site admin user
  I want to be able Block user accounts
  So that they will be disabled and not be able to use the site.

  Scenario: Check if the "test_authenticated" user is not blocked. and can login.
    Given I am on "user/login"
     When I fill in "test_authenticated" for "Username"
      And I fill in "dD.123123" for "Password"
      And I press "Log in"
      And I wait
     Then I should see "History"
      And I should see "Member for"

  Scenario: Check if the site admin can Administer users and disable a User account "test_authenticated" from accessing the site.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/admin/people"
      And wait
     Then I should see "People"
     When I fill in "test_authenticated" for "Username"
      And I press "Apply"
      And wait
     Then I should see "test_authenticated"
     When I click "test_authenticated"
      And wait
     Then I should see "History"
     When I click "Edit"
      And wait
     When I select the radio button "Blocked"
      And I press "Save"
     Then I should see "The changes have been saved."
      And wait
      And the "Blocked" checkbox should be checked

  Scenario: Check if the blocked user with user id of <Test Blocked User ID> can or can not login.
    Given I am on "user/login"
     When I fill in "test_authenticated" for "Username"
      And I fill in "dD.123123" for "Password"
      And I press "Log in"
     Then I should not see "History"
      But I should see "The username test_authenticated has not been activated or is blocked."
