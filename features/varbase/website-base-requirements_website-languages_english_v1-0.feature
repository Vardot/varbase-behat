Feature: Website Base Requirements - Website Languages - English
  As a logged in user with the permission to add content
  I want to be able to check if the site has got the English language Enabled
  So that can be sure that the website is using the English language as one of the languages.

  @javascript
  Scenario: Check if we can Create Basic page with English for the language of the content.
    Given I am a logged in user with the "webmaster" user
      And I go to "node/add/page"
    When I select "English" from "Language"
    Then I should see "Language"
    When I select "English" from "Language"
      And I fill in "Test English Basic page title by webmaster" for "Title"
      And I fill in the rich text editor field "Body" with "Test English Basic page body"
      And I press the "Save" button
    Then I should see "Test English Basic page title by webmaster"

  @javascript
  Scenario: Check if we can Create Landing page with English for the language of the content.
    Given I am a logged in user with the "webmaster" user
      And I go to "node/add/landing-page"
    When I select "English" from "Language"
    Then I should see "Language"
    When I select "English" from "Language"
      And I fill in "Test English Landing page title by webmaster" for "Title"
      And I press the "Save" button
    Then I should see "Test English Landing page title by webmaster"

    @javascript
    Scenario: Check if we can Create Basic page with English for the language of the content.
      Given I am a logged in user with the "test_content_admin" user
        And I go to "node/add/page"
      When I select "English" from "Language"
      Then I should see "Language"
      When I select "English" from "Language"
        And I fill in "Test English Basic page title by content admin" for "Title"
        And I fill in the rich text editor field "Body" with "Test English Basic page body"
        And I press the "Save" button
      Then I should see "Test English Basic page title by content admin"

    @javascript
    Scenario: Check if we can Create Landing page with English for the language of the content.
      Given I am a logged in user with the "test_content_admin" user
        And I go to "node/add/landing-page"
      When I select "English" from "Language"
      Then I should see "Language"
      When I select "English" from "Language"
        And I fill in "Test English Landing page title by content admin" for "Title"
        And I press the "Save" button
      Then I should see "Test English Landing page title by content admin"

      @javascript
      Scenario: Check if we can Create Basic page with English for the language of the content.
        Given I am a logged in user with the "test_site_admin" user
          And I go to "node/add/page"
        When I select "English" from "Language"
        Then I should see "Language"
        When I select "English" from "Language"
          And I fill in "Test English Basic page title by site admin" for "Title"
          And I fill in the rich text editor field "Body" with "Test English Basic page body"
          And I press the "Save" button
        Then I should see "Test English Basic page title by site admin"

      @javascript
      Scenario: Check if we can Create Landing page with English for the language of the content.
        Given I am a logged in user with the "test_site_admin" user
          And I go to "node/add/landing-page"
        When I select "English" from "Language"
        Then I should see "Language"
        When I select "English" from "Language"
          And I fill in "Test English Landing page title by site admin" for "Title"
          And I press the "Save" button
        Then I should see "Test English Landing page title by site admin"
