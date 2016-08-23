Feature: Content Structure Features - Basic Pages - Basic page
  As a logged in user with a permission to mange Basic pages
  I want to be able to add a "Basic page" to the site with a fixed layout
  So that the "Basic page" will show up in the structured menu under it's parent page

# Check if users with the ( "authenticated user", "Editor", "Content Admin", "Site Admin", or "Super Admin" ) role can add [Basic page]
  Scenario: Check if [authenticated user] can add content of "Basic page" type.
    Given I am a logged in user with the "test_authenticated" user
     When I go to "/node/add"
     Then I should not see "Basic page"

  Scenario: Check if [Editor] can add content of "Basic page" type.
    Given I am a logged in user with the "test_editor" user
     When I go to "/node/add"
     Then I should not see "Basic page"

  Scenario: Check if [Content Admin] can add content of "Basic page" type.
    Given I am a logged in user with the "test_content_admin" user
     When I go to "/node/add"
     Then I should not see "Basic page"

  Scenario: Check if [Site Admin] can add content of "Basic page" type.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add"
     Then I should not see "Basic page"

  Scenario: Check if [Super Admin] can add content of "Basic page" type.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "/node/add"
     Then I should see "Basic page"

  Scenario: Check if the webmaster can add content of "Basic page" type.
    Given I am a logged in user with the "webmaster" user
     When I go to "/node/add"
     Then I should see "Basic page"

  Scenario: Check if a user with a permission to manage "Basic page" content type can create Basic pages content
    Given I am a logged in user with the "test_super_admin" user
     When I go to "/node/add/page"
     Then I should see "Create Basic page"
      And I should see "Language"
      And I should see "Title"
      And I should see "Body"

  Scenario: Check if we can create a Test Basic page we can see Change layout floating button to change the layout.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "node/add/page"
      And I fill in "Test Basic page" for "Title"
      And I fill in "Test Basic page body" for "edit-body-und-0-value"
      And I press "Save"
     Then I should see "Basic page Test Basic page has been created."

  Scenario: Check if a user with a permission to manage "Basic page" content type
    Given I am a logged in user with the "test_super_admin" user
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test Basic page" for "Title"
      And I press the "Apply" button
     Then I should see "Test Basic page"
     When I click "Test Basic page"
     Then I should see "Test Basic page body"
     When I click "Edit"
     Then I should see "Edit Basic page Test Basic page"

  Scenario: Check that we did not Allow content of "Basic page" type to have its display controlled by Panelizer.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/page"
     Then the "Panelize" checkbox should not be checked
