Feature: Delete Arabic language from the system.

  @javascript @tools @arabic @local
  Scenario: Delete Arabic language from the system.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/config/regional/language/delete/ar"
      And wait
     Then I should see "Are you sure you want to delete the language Arabic?"
     When I press "Delete"
      And wait
     Then I should see "The language Arabic has been removed."
  
