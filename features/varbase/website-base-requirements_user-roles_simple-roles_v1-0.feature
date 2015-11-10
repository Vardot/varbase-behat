Feature: Website Base Requirements - User Roles - Simple Roles
  As a logged in user with the User ID number 1
  I want to be able to see the list of User Roles
  So that they must be (Editor, Site Admin, Content Admin, Super Admin)

  Scenario: Check the list of Roles under people permissions.
    Given I am logging in as "webmaster"
     When I go to "/admin/people/permissions/roles"
     Then I should see "Editor"
     And  I should see "Content admin"
     And  I should see "Site admin"
     And  I should see "Super admin"
