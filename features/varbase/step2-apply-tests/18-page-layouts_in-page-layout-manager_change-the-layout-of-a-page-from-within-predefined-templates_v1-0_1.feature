Feature: Page Layouts -  In-Page Layout Manager - Change the layout of a page from within predefined templates
As a logged in user with a permission to Administer Panelizer layout for "landing page" content type
I want to be able to see "Change layout" for the current "Landing page"
So that I will be able to Change the layout of the page to use one of the predefined templates

  @local @development @staging @production
  Scenario: Check if In-Place Editor to Allow privileged users to update and rearrange the content while viewing.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page/panelizer/page_manager"
     Then the "In-Place Editor" checkbox should be checked
  
  @local @development @staging @production
  Scenario: Check if we create a Test Landing page we can see Change layout floating button to change the layout.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "node/add/landing-page"
      And I fill in "Test landing page by test site admin" for "Title"
      And I check the box "Published"
      And I press "Save"
     Then I should see "Landing page Test landing page by test site admin has been created."
      And I should see "Change Layout"
  
  @javascript @local @development @staging @production
  Scenario: Check that a user with the editor role which has NO permission to change layouts can not see Change Layout for published landing pages.
    Given I am a logged in user with the "test_editor" user
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test landing page by test site admin" for "Title"
      And I press the "Apply" button
     Then I should see "Test landing page by test site admin"
     When I click "Test landing page by test site admin"
      And I wait
     Then I should see "Test landing page by test site admin"
      And I should not see "Change layout"
  
  @javascript @local @development @staging @production
  Scenario: Check that a user with the content admin role which has permission to change layouts can see Change Layout for published landing pages.
    Given I am a logged in user with the "test_content_admin" user
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test landing page by test site admin" for "Title"
      And I press the "Apply" button
     Then I should see "Test landing page by test site admin"
     When I click "Test landing page by test site admin"
      And I wait
     Then I should see "Test landing page by test site admin"
      And I should see "Change layout"
  
  @javascript @local @development @staging @production
  Scenario: Check if a user with permission to Administer Panelizer layout can change the layout of a landing page.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test landing page by test site admin" for "Title"
      And I press the "Apply" button
     Then I should see "Test landing page by test site admin"
     When I click "Test landing page by test site admin"
      And I wait
     Then I should see "Test landing page by test site admin"
      And I should see "Change layout"
     When I click "Change layout"
      And I wait for AJAX to finish
     Then I should see "Category"
     When I click "Downstairs"
      And I wait for AJAX to finish
     Then I should see "Save as custom"
     When I press "Save as custom"
      And I wait for AJAX to finish
     Then I should not see "Category"
     When I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Save"
     When I press "Save"
     Then I should not see "Save"
  
