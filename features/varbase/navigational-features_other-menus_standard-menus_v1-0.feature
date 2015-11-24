Feature: Navigational Features - Other menus - Standard menus
  As a logged as webmaster
  I want to be able to add new custom menu, then add menu links
  So that I will be able to place the custom menu in regions, and positions

  Background:
    Given I am a logged in user with the "webmaster" user

  @javascript
  Scenario: Add new custom menu
    Given I go to "/admin/structure/menu/add"
     When I fill in "custom Menu" for "Title"
      And I press "Save"
     Then I should see "custom Menu"
      And I should see "Add link"

  @javascript
  Scenario: Add a list of Menu links to Custom Menu
    Given I go to "/admin/structure/menu/manage/menu-custom-menu/"
     When I click "Add link"
      And I fill in "Test link 1" for "Menu link title"
      And I fill in "<front>" for "Path"
      And I press "Save"
     Then I should see "Your configuration has been saved."
     When I go to "admin/structure/menu/manage/menu-custom-menu"
     When I click "Add link"
      And I fill in "Test link 2" for "Menu link title"
      And I fill in "<front>" for "Path"
      And I press "Save"
     Then I should see "Your configuration has been saved."
