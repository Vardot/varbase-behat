Feature: User login
 To Test User login to the site

@api @wip
  Scenario: Testing the User login.
    Given I am logging in as "webmaster"
     When I visit "user/1"
      And I should see "Log out"
