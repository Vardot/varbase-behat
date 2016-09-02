Feature: Delete French language from the system.

  @javascript @feanch @local
  Scenario: Delete French language from the system.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/config/regional/language/delete/fr"
      And wait
     Then I should see "Are you sure you want to delete the language French?"
     When I press "Delete"
      And wait
     Then I should see "The language French has been removed."
  
