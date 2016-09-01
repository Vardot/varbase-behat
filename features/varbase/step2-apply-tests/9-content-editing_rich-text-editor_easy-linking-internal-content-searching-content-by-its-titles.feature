Feature: Content Editing - Rich Text Editor - Easy linking to internal content by searching for content by its titles
  As a content admin
  I want to be able to add internal links searching the title of an internal content
  So that will ease the work of adding internal links in the rich text editor fields.

@javascript @DEV @STG @PROD
  Scenario: Check if inserted raw URL will convert into a link when we save when
  We are using the "Visual editor" text format.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/page"
      And wait
     Then I should see "Create Basic page"
     When I select "visual_editor" from "body[und][0][format]"
      And I fill in "Linking to internal content #1 title" for "Title"
      And I fill in the rich text editor field "Body" with "Linking to internal content #1 body"
     Then I press "Save"
      And wait
      And I should see "Linking to internal content #1 body"

     When I go to "/node/add/page"
      And wait
     Then I should see "Create Basic page"
     When I select "visual_editor" from "body[und][0][format]"
      And I fill in "Linking to internal content #2 title" for "Title"
      And I fill in the rich text editor field "Body" with "   Linking to internal content #2 body  "
      And I click on "linkit" command button in the rich text editor field "Body"
      And I wait for AJAX to finish
     Then I should see "Search for content."
     When I fill in "Linking to internal content #1" for "Search for content."
      And I wait for AJAX to finish
      And I press the "enter" key in the "Search for content." field
      And I wait for AJAX to finish
      And I press "Insert link"
      And I wait for AJAX to finish
      And wait 5s

     When I press "Save"
      And wait
      And I should see "Linking to internal content #2 body"
      And I should see "Linking to internal content #1 title"

     When I click "Linking to internal content #1 title"
      And wait
     Then I should see "Linking to internal content #1 body"
