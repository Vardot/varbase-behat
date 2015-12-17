Feature: Content Editing - Rich Text Editor - Undo, Redo, Copy, Paste
  As a content admin
  I want to be able to Undo, Redo, Copy, Paste in the rich text editor
  So that I will be able to manage the work as we do in normal Desktop editors

 @javascript
 Scenario: Check if content admin can Copy, Cut, and Paste in the rich text editor.
  Given I am a logged in user with the "test_site_admin" user
   When I go to "/node/add/page"
    And wait
   Then I should see "Create Basic page"
    And I should see "Body"
    And I should see "Text format"

  When I select "visual_editor" from "Text format"
   And I fill in "Test Copy and Paste" for "Title"
   And I fill in the rich text editor field "Body" with "Text line #1 <br />"
   And I append the rich text editor field "Body" with "Text line #2 <br />"
   And I append after the rich text editor field "Body" with "Text line #3 <br />"
   And I prepend the rich text editor field "Body" with "Text line #0 <br />"
   And I prepend before the rich text editor field "Body" with "Text line #-1 <br />"
   And I select all text in "Body" rich text editor field
   And break
   And I copy selected text to clipboard text
   And wait 10s


  #  And I fill in "Title" from clipboard text
  #  And I fill in "Title" from clipboard text
  #  And I fill in "Title" from clipboard text
