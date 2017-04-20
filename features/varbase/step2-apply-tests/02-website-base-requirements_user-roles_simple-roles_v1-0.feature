Feature: Website Base Requirements - User Roles - Simple Roles
As a logged in user with the User ID number 1
I want to be able to see the list of User Roles
So that they must be (Editor, Site Admin, Content Admin, Super Admin)

  @local @development @staging @production
  Scenario: Check If all default list of user roles are present under people permissions.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/people/permissions/roles"
      And I wait
     Then I should see "Editor"
      And I should see "Content Admin"
      And I should see "Site Admin"
      And I should see "Super Admin"
  