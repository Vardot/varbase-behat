Feature: Page Layouts - Site widgets available in layouts - Re-use components or blocks across all pages
  As a logged in user with a permission to Administer Panelizer content for "landing page" content type
  I want to be able to use reusable components, blocks across all pages in the site
  So that the site can show up pans, blocks, or site widgets in any selected page

  @DEV @STG @PROD
  Scenario: Check if In-Place Editor to allow privileged users to update and rearrange the content while viewing.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page/panelizer"
     Then the "New Entity field" checkbox should be checked
      And the "New Custom content" checkbox should be checked
      And the "New Block" checkbox should be checked
      And the "New Entity extra field" checkbox should be checked
      And the "New Tokens" checkbox should be checked
      And the "New Rendered entity" checkbox should be checked
      And the "New Fielded custom content" checkbox should be checked
      And the "New All views" checkbox should be checked
      And the "New View panes" checkbox should be checked
      And the "New content of other types" checkbox should be checked

  @DEV @STG @PROD
  Scenario: Check if In-Place Editor to allow privileged users to update and rearrange the content while viewing.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page/panelizer/page_manager"
     Then the "In-Place Editor" checkbox should be checked

  @DEV @STG @PROD
  Scenario: Check if we create a Test Landing page we can see Customize this page floating button.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing-page"
      And I fill in "Test Landing page by test site admin" for "Title"
      And I press "Save"
      And wait
     Then I should see "Landing page Test Landing page by test site admin has been created."
      And I should see "Customize this page"

  @javascript @DEV @STG @PROD
  Scenario: Check that a user with a permission to customize content can add reusable components
    Given I am a logged in user with the "test_site_admin" user
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test Landing page by test site admin" for "Title"
      And I press the "Apply" button
      And I wait for AJAX to finish
     Then I should see "Test Landing page by test site admin"
     When I click "Test Landing page by test site admin"
      And I wait for AJAX to finish
      And I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Add new pan"
     When I click "Add new pane"
      And I wait for AJAX to finish
     Then I should see "Activity"
      And I should see "Dashboard"
      And I should see "Display Suite"
      And I should see "Menus"
      And I should see "Miscellaneous"
      And I should see "Node"
      And I should see "Page elements"
      And I should see "Views"
      And I should see "Widgets"
