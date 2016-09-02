Feature: User Management - Standard User Management - Login
As a visitor with an existing user account
I want to be able to login to the site
So that I will be able to view/add/edit/ or delete content in the site

  @local @development @staging @production
  Scenario: Check if the a visitor can login with a valid username and password.
    Given I am on "user/login"
     When I fill in "test_authenticated" for "Username"
      And I fill in "dD.123123" for "Password"
      And I press "Log in"
      And wait
     Then I should see "History"
      And I should see "Member for"
  
  @local @development @staging @production
  Scenario: Check a failed response after not entering to enter username or password when we login.
    Given I am on "user/login"
     When I press "Log in"
      And wait
     Then I should see "Username field is required"
      And I should see "Password field is required"
  
