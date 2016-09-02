Feature: Page Layouts - In-page layout manager - Drag-and-drop page components to reorder or structure the page
As a logged in user with a permission to Administer Panelizer content for "landing page" content type
I want to be able to see "Customize this page" for the current "Landing page"
So that I will be able to Customize content, drag and drop page components to reorder or change the structure of the page

  @local @development @staging @production
  Scenario: Check if In-Place Editor to Allow privileged users to update and rearrange the content while viewing.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page/panelizer/page_manager"
     Then the "In-Place Editor" checkbox should be checked
  
  @javascript @local @development @staging @production
  Scenario: Add a "Test Landing page" And check the layout to "Left sidebar" Basic Layout.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing-page"
      And I fill in "Test Landing page" for "Title"
      And I press "Save"
      And I wait for AJAX to finish
     Then I should see "Landing page Test Landing page has been created."
      And I should see "Customize this page"
      And I should see "Change layout"
  
     When I click "Change layout"
      And I wait for AJAX to finish
     Then I should see "Change layout"
     When I select "Basic layouts" from "categories"
      And I click "Left sidebar"
      And I wait for AJAx to finish
      And I press "Save as custom"
      And I wait for AJAX to finish
     When I click "Customize this page"
      And I wait for AJAX to finish
     When I press "Save"
      And I wait for AJAX to finish
  
  @javascript @local @development @staging @production
  Scenario: Add Test 1 custom content pane to the "Test Landing page".
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/admin/content"
      And I wait
     Then I should see "Content"
     When I fill in "Test Landing page" for "Title"
      And I press the "Apply" button
      And I wait for AJAX to finish
     Then I should see "Test Landing page"
     When I click "Test Landing page"
      And wait 5s
      And I wait for AJAX to finish
     Then I should see "Customize this page"
  
     When I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Add new pane" in the "left" panel region
     Then I should see "Add new pane" in the "center" panel region
  
  # Add Test 1 custom content pane.
     When I click "Add new pane" in the "left" panel region
      And I wait for AJAX to finish
     Then I should see "Add content to Left Sidebar"
     When I click "HTML"
      And I wait for AJAX to finish
      And I fill in "Test 1 HTML content title" for "Title"
      And I fill in the rich text editor field "HTML" with "Test 1 HTML content body"
      And I press "Finish"
      And I wait for AJAX to finish
     When I press "Save"
      And I wait for AJAX to finish
     Then I should see "Test 1 HTML content title"
  
  @javascript @local @development @staging @production
  Scenario: Add Test 2 custom content pane to the "Test Landing page".
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/admin/content"
      And I wait
     Then I should see "Content"
     When I fill in "Test Landing page" for "Title"
      And I press "Apply"
      And I wait for AJAX to finish
     Then I should see "Test Landing page"
     When I click "Test Landing page"
      And I wait 5s
      And I wait for AJAX to finish
     Then I should see "Customize this page"
      And I should see "Test 1 HTML content title"
  
     When I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Add new pane" in the "left" panel region
     Then I should see "Add new pane" in the "bottom" panel region
  
  # Add Test 2 custom content pane.
     When I click "Add new pane" in the "left" panel region
      And I wait for AJAX to finish
     Then I should see "Add content to Left Sidebar"
     When I click "HTML"
      And I wait for AJAX to finish
      And I fill in "Test 2 HTML content title" for "Title"
      And I fill in the rich text editor field "HTML" with "Test 2 HTML content body"
      And I press "Finish"
      And I wait for AJAX to finish
     When I press "Save"
      And I wait for AJAX to finish
     Then I should see "Test 2 HTML content title"
      And I should see "Test 1 HTML content title"
  
  @javascript @local @development @staging @production
  Scenario: Check that a user with a permission to customize content can drag
  Drop panes then save.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/admin/content"
      And I wait
     Then I should see "Content"
     When I fill in "Test Landing page" for "Title"
      And I press "Apply"
      And I wait for AJAX to finish
     Then I should see "Test Landing page"
     When I click "Test Landing page"
      And I wait for AJAX to finish
     Then I should see "Test 1 HTML content title" in the "left" panel region
      And I should see "Test 2 HTML content title" in the "left" panel region
  
     When I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Add new pane" in the "left" panel region
  
     When I drag and drop "#panels-ipe-regionid-left .panels-ipe-portlet-wrapper" to "#panels-ipe-regionid-center .panels-ipe-sort-container"
     Then I wait for AJAX to finish
      And I wait 5s
     When I press "Save"
      And I wait for AJAX to finish
     Then I should not see "Add new pane"
      And I should see "Test 1 HTML content title" in the "center" panel region
      And I should see "Test 2 HTML content title" in the "center" panel region
  
