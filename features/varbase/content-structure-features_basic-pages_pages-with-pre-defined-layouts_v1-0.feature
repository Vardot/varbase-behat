Feature: Content Structure Features - Basic Pages - Pages with pre-defined layouts
  As a logged in user with a permission to manage Landing pages.
  I want to be able to add a "Landing page" which has got predefined layouts
  So that the "Landing page" will show up in the structured menu under it's parent page

  Scenario: Check if we do have the "Landing page" content type.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types"
     Then I should see "Landing page"

  Scenario: Check that "Landing page" type have its display controlled by Panelizer.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page"
     Then the "Panelize" checkbox should be checked
      And the "Full page override" checkbox should be checked
      And the "panelizer[view modes][page_manager][default]" checkbox should be checked

  Scenario: Check that Anonymous users can not create a Landing page.
    Given I am an anonymous user
     When I go to "/node/add/landing-page"
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."

  Scenario: Check that authenticated users can not create a Landing page.
    Given I am a logged in user with the "test_authenticated" user
     When I go to "/node/add/landing-page"
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."

  Scenario: Check that Editor users can not create a Landing page.
    Given I am a logged in user with the "test_editor" user
     When I go to "/node/add/landing-page"
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."

  Scenario: Check that Content Admin users can not create a Landing page.
    Given I am a logged in user with the "test_content_admin" user
     When I go to "/node/add/landing-page"
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."

  @javascript
  Scenario: Check that Site Admin users can not create a Landing page.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/landing-page"
     Then I should see "Create Landing page"
     When I fill in "Test landing page by test site admin" for "Title"
     Then I press "Save"
      And wait
     When I go to "/content/test-landing-page-test-site-admin"
      And wait
     Then I should see "Test landing page by test site admin"
      And I should see "Customize this page"
      And I should see "Change layout"

  @javascript
  Scenario: Check that Super Admin users can not create a Landing page.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "/node/add/landing-page"
     Then I should see "Create Landing page"
     When I fill in "Test landing page by test super admin" for "Title"
     Then I press "Save"
      And wait
     When I go to "/content/test-landing-page-test-super-admin"
      And wait
     Then I should see "Test landing page by test super admin"
      And I should see "Customize this page"
      And I should see "Change layout"
