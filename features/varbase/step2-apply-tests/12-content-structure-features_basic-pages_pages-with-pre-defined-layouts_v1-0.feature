Feature: Content Structure Features - Basic Pages - Pages with pre-defined layouts
As a logged in user with a permission to manage Landing pages.
I want to be able to add a "Landing page" which has got predefined layouts
So that the "Landing page" will show up in the structured menu under its parent page

@local @development @staging @production
  Scenario: Check if we do have the "Landing page" content type.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types"
      And I wait
     Then I should see "Landing page"
  
  @local @development @staging @production
  Scenario: Check that "Landing page" type have its display controlled by Panelizer.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page"
      And I wait
     Then the "Panelize" checkbox should be checked
      And the "Full page override" checkbox should be checked
      And the "panelizer[view modes][page_manager][default]" checkbox should be checked
  
  @local @development @staging @production
  Scenario: Check that Anonymous users can not create a Landing page.
    Given I am an anonymous user
     When I go to "/node/add/landing-page"
      And I wait
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."
  
  @local @development @staging @production
  Scenario: Check that authenticated users can not create a Landing page.
    Given I am a logged in user with the "test_authenticated" user
     When I go to "/node/add/landing-page"
      And I wait
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."
  
  @local @development @staging @production
  Scenario: Check that Editor users can not create a Landing page.
    Given I am a logged in user with the "test_editor" user
     When I go to "/node/add/landing-page"
      And I wait
     Then I should see "Access denied"
      And I should see "You are not authorized to access this page."
  
  @local @development @staging @production
  Scenario: Check that Content Admin users can not create a Landing page.
    Given I am a logged in user with the "test_content_admin" user
     When I go to "/node/add/landing-page"
      And I wait
     Then I should not see "Access denied"
      And I should not see "You are not authorized to access this page."
  
  @javascript @local @development @staging @production
  Scenario: Check that Site Admin users can not create a Landing page.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/landing-page"
      And I wait
     Then I should see "Create Landing page"
     When I fill in "Test landing page by test site admin" for "Title"
     Then I press "Save"
      And I wait
     When I go to "/content/test-landing-page-test-site-admin"
      And I wait
     Then I should see "Test landing page by test site admin"
      And I should see "Customize this page"
      And I should see "Change layout"
  
  @javascript @local @development @staging @production
  Scenario: Check that Super Admin users can not create a Landing page.
    Given I am a logged in user with the "test_super_admin" user
     When I go to "/node/add/landing-page"
      And I wait
     Then I should see "Create Landing page"
     When I fill in "Test landing page by test super admin" for "Title"
     Then I press "Save"
      And I wait
     When I go to "/content/test-landing-page-test-super-admin"
      And I wait
     Then I should see "Test landing page by test super admin"
      And I should see "Customize this page"
      And I should see "Change layout"
  
