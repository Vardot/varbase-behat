Feature:
As a user with a username and password
so that I will be able to login to th site
then I can view profile page.


Scenario: Log in to the site and see my account

  Given I am on "user"
  And I fill in "webmaster" for "name"
  And I fill in "V@rd0t!@#" for "pass"
  And I press "Log in"
  Then I should see "log out"
