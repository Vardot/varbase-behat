Feature: Navigational Features - Other menus - Standard menus
As a logged as webmaster
I want to be able to add new custom menu, then add menu links
So that I will be able to place the custom menu in regions, and positions

  Background: 
    Given I am a logged in user with the "webmaster" user
  
  @javascript @local @development @staging @production
  Scenario: Add new custom menu
    Given I go to "/admin/structure/menu/add"
      And I wait
     When I fill in "Test custom Menu" for "Title"
      And I press "Save"
      And I wait
     Then I should see "Test custom Menu"
      And I should see "Add link"
  
  @javascript @local @development @staging @production
  Scenario: Add a list of Menu links to Test custom Menu
    Given I go to "/admin/structure/menu/manage/menu-test-custom-menu/"
      And I wait
     When I click "Add link"
      And I fill in "Test link 1" for "Menu link title"
      And I fill in "<front>" for "Path"
      And I press "Save"
      And I wait
     Then I should see "Your configuration has been saved."
     When I go to "admin/structure/menu/manage/menu-test-custom-menu"
     When I click "Add link"
      And I fill in "Test link 2" for "Menu link title"
      And I fill in "<front>" for "Path"
      And I press "Save"
      And I wait
     Then I should see "Your configuration has been saved."
  
  @javascript @local @development @staging @production
  Scenario: Delete the Test custom Menu.
    Given I go to "admin/structure/menu/manage/menu-test-custom-menu/edit"
      And I wait
     Then I should see "Test custom Menu"
     When I press "Delete"
      And I wait
     Then I should see "Are you sure you want to delete the custom menu Test custom Menu?"
     When I press "Delete"
      And I wait
     Then I should see "The custom menu Test custom Menu has been deleted."
  
