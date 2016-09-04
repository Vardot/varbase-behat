Feature: Delete testing fieldable pane entities.

  Background: 
    Given I am a logged in user with the "webmaster" user
  
  @javascript @tools @local @development @staging
  Scenario: Delete "Test reusable HTML widget" fieldable pane entity.
     When I go to "/admin/content/fieldable_pane_entity"
      And I wait
     Then I should see "Test reusable HTML widget"
     When I click "Test reusable HTML widget"
      And I wait
     Then I should see "Content of the Test reusable HTML widget"
     When I click "Delete"
      And I wait
     Then I should see "Are you sure you want to delete Test reusable HTML widget?"
     When I press "Delete"
      And I wait
     Then I should see "HTML Test reusable HTML widget has been deleted."

  @javascript @tools @local @development @staging
  Scenario: Delete "Test 1 HTML content title" fieldable pane entity.
     When I go to "/admin/content/fieldable_pane_entity"
      And I wait
     Then I should see "Test 1 HTML content title"
     When I click "Test 1 HTML content title"
      And I wait
     Then I should see "Test 1 HTML content body"
     When I click "Delete"
      And I wait
     Then I should see "Are you sure you want to delete Test 1 HTML content title?"
     When I press "Delete"
      And I wait
     Then I should see "HTML Test 1 HTML content title has been deleted."

  @javascript @tools @local @development @staging
  Scenario: Delete "Test 2 HTML content title" fieldable pane entity.
     When I go to "/admin/content/fieldable_pane_entity"
      And I wait
     Then I should see "Test 2 HTML content title"
     When I click "Test 2 HTML content title"
      And I wait
     Then I should see "Test 2 HTML content body"
     When I click "Delete"
      And I wait
     Then I should see "Are you sure you want to delete Test 2 HTML content title?"
     When I press "Delete"
      And I wait
     Then I should see "HTML Test 2 HTML content title has been deleted."