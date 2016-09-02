Feature: Page Layouts - Site Widgets Available In Layouts - Create and re-use custom HTML widgets
As a logged in user with a permission to Administer Panelizer content for "landing page" content type
I want to be able to use reusable custom HTML widgets
So that the site can show up the same custom HTML widget pan in other Landing pages

  @local @development @staging @production
  Scenario: Check if In-Place Editor to allow privileged users to update and rearrange the content while viewing.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page/panelizer"
      And the "New Custom content" checkbox should be checked
      And the "New Rendered entity" checkbox should be checked
      And the "New Fielded custom content" checkbox should be checked
  
  @local @development @staging @production
  Scenario: Check if In-Place Editor to allow privileged users to update and rearrange the content while viewing.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page/panelizer/page_manager"
     Then the "In-Place Editor" checkbox should be checked
  
  @javascript @local @development @staging @production
  Scenario: Check if a user with permission to administer landing page content can create a custom reusable HTML widget.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/landing-page"
     Then I should see "Create Landing page"
     When I fill in "Test landing page by test site admin 1" for "Title"
     Then I press "Save"
      And wait
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test landing page by test site admin 1" for "Title"
      And I press the "Apply" button
     Then I should see "Test landing page by test site admin 1"
     When I click "Test landing page by test site admin 1"
      And I wait for AJAX to finish
     Then I should see "Test landing page by test site admin 1"
      And I should see "Customize this page"
      And I should see "Change layout"
     When I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Add new pane"
     When I click "Add new pane"
      And I wait for AJAX to finish
     Then I should see "HTML"
     When I click "HTML"
      And I wait for AJAX to finish
     Then I should see "Configure new HTML"
      And I should see "Reusability"
     When I fill in "Test reusable HTML widget" for "Title"
      And I fill in the rich text editor field "HTML" with "Content of the Test  reusable HTML widget"
      And I fill in "Test reusable HTML widget admin title" for "Administrative title"
      And I fill in "Test reusable HTML widget admin description." for "Administrative description"
      And I click "Reusability"
      And I check "Make this entity reusable"
      And I fill in "Testing Page elements" for "Category"
      And I click "Admin"
      And I press "Finish"
      And wait
     Then I should see "Test reusable HTML widget"
      And I should see "Content of the Test reusable HTML widget"
     When I press "Save"
      And wait
     Then I should not see "Add new pane"
  
  @javascript @local @development @staging @production
  Scenario: Check if a user with permission to administer landing page content can add a ready reusable HTML widget.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/landing-page"
     Then I should see "Create Landing page"
     When I fill in "Test landing page by test site admin 2" for "Title"
     Then I press "Save"
      And wait
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test landing page by test site admin 2" for "Title"
      And I press the "Apply" button
     Then I should see "Test landing page by test site admin 2"
     When I click "Test landing page by test site admin 2"
      And I wait for AJAX to finish
     Then I should see "Test landing page by test site admin 2"
      And I should see "Customize this page"
      And I should see "Change layout"
     When I click "Customize this page"
      And I wait for AJAX to finish
     Then I should see "Add new pane"
     When I click "Add new pane"
      And I wait for AJAX to finish
     Then I should see "Testing Page elements"
     When I click "Testing Page elements"
      And I wait for AJAX to finish
     Then I should see "Test reusable HTML widget admin title"
     When I click "Test reusable HTML widget admin title"
      And I wait for AJAX to finish
     Then I should see "Configure new Test reusable HTML widget admin title"
     When I press "Finish"
      And I wait for AJAX to finish
     Then I should see "Test reusable HTML widget"
      And I should see "Content of the Test reusable HTML widget"
  
