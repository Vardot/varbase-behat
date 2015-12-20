Feature: Content Editing - Rich Text Editor - Undo, Redo, Copy, Paste
  As a content admin
  I want to be able to Undo, Redo, Copy, Paste in the rich text editor
  So that I will be able to manage the work as we do in normal Desktop editors

 @javascript @wip
 Scenario: Check if content admin can Copy, Cut, and Paste in the rich text editor.
  Given I am a logged in user with the "test_site_admin" user
   When I go to "/node/add/page"
   Then I should see "Create Basic page"
  When I fill in "Test cut copy and paste" for "Title"
   And I select "English" from "Language"
   And I select "Visual editor" from "Text format"
   And I fill in the rich text editor field "Body" with "<p id='bold-text'>Test bold text #1</p>"
   And I move focus to "Body" rich text editor field
   And break
   And I select all text in "Body" field
   And break
   And I click on "bold" command button in the rich text editor field "Body"
   And break


  #  And I append the rich text editor field "Body" with "<p>Test Italic text #2</p>"
  #  And I append after the rich text editor field "Body" with "<p>Test under line text #3</p>"
  #  And I append the rich text editor field "Body" with "<p>Test text to copy #4</p>"
  #  And I append the rich text editor field "Body" with "<p>Test text to cut #5</p>"
  #  And I append the rich text editor field "Body" with "<p>Test text #6</p>"
  #  And I prepend the rich text editor field "Body" with "<p>Test text #0</p>"
  #  And I prepend before the rich text editor field "Body" with "<p>Text text #-1</p>"
  #  And I append after the rich text editor field "Body" with "<table id='table-t1'><thead><tr><th>Heading</th><th>Heading</th></tr></thead><tbody><tr><td>cell</td><td>cell</td></tr></tbody></table>"
  #  And I move focus to "Body" rich text editor field
  #  And I select all text in "Body" field
  #
  #  And break
