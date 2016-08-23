Feature: Add French language if we do not have it to languages in the system.

@javascript
Scenario: Add French language if we do not have it to languages in the system.
  Given I am a logged in user with the "webmaster" user
   When I go to "/admin/config/regional/language"
    And wait
   Then I should not see "French"
    But I should see "Add language"
   When I click "Add language"
    And wait
   Then I should see "Add a language to be supported by your site."
   When I select "fr" from "Language name"
    And I press "Add language"
   Then I should see "Updating translations"
    And wait max of 240s
    When I go to "/admin/config/regional/language"
     And wait
    Then I should see "French"

  @javascript
  Scenario: Add Arabic language if we do not have it to languages in the system.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/config/regional/language/configure"
     Then I should see "User interface text language detection"
     When I check the box "language[enabled][locale-url]"
      And I press "Save settings"
