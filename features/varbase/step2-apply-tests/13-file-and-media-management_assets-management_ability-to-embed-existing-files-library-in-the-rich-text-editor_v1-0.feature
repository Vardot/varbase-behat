Feature: File & Media Management - Assets Management - Ability to embed existing files library in the rich text editor
As a content admin
I want to be able to embed existing files from the library of files in the CKEditor
So that it will show up under that rich text field without having to upload the image for each content

  Background: 
    Given I am a logged in user with the "test_super_admin" user
  
  # Create the Basic page and upload the file to the library before the test case.
  # ----------------------------------------------------------------------------
  @javascript @local @development @staging @production
  Scenario: Create the "Test Basic page to embed existing files" content.
     When I go to "node/add/page"
      And I fill in "Test Basic page to embed existing files" for "Title"
      And I fill in the rich text editor field "Body" with "Test Basic page body to embed existing files"
      And I press the "Save" button
     Then I should see "Basic page Test Basic page to embed existing files has been created."
  
  @local @development @staging @production
  Scenario: Upload the "Embed Flag Earth" file.
     When I go to "admin/content/file"
     Then I should see "Add file"
     When I click "Add file"
     Then I should see "Upload a new file"
     When I attach the file "flag-earth.jpg" to "Upload a new file"
      And I press the "Upload" button
     Then I should see "flag-earth.jpg"
     When I press the "Next" button
     Then I should see "Alt Text"
     When I fill in "Embed Flag Earth" for "Name *"
      And I fill in "Embed Flag Earth in space" for "Alt Text"
      And I fill in "Embed Flag Earth all earth in space" for "Title Text"
      And I press the "Save" button
     Then I should see "Add file"
      And I should see the "Edit" in the "Embed Flag Earth" row
  #-----------------------------------------------------------------------------
  
  @javascript @local @development @staging @production
  Scenario: Check if we are able to embed existing files library in the rich text editor.
     When I go to "admin/content"
     Then I should see "Content"
     When I fill in "Test Basic page to embed existing files" for "Title"
      And I press the "Apply" button
     Then I should see "Test Basic page to embed existing files"
     When I click "Test Basic page to embed existing files"
     Then I should see "Test Basic page body to embed existing files"
     When I click "Edit"
     Then I should see "Edit Basic page Test Basic page to embed existing files"
     When I click on "media" command button in the rich text editor field "Body"
      And I wait for AJAX to finish
     Then I should see "Media browser"
      And the media browser is open
     When I click on the "Library" tab under the media browser
      And I wait for AJAX to finish
     Then I should see "Media browser"
     When I fill in "Embed Flag Earth" for "File name" under the media browser
      And I press the "Apply" button under the media browser
     Then I should see "Embed Flag Earth" under the media browser
     When I select the "Embed Flag Earth" file under the media browser
      And I click "Submit" button under the media browser
      And I wait for AJAX to finish
     Then I should see "Embedding Embed Flag Earth" under the media browser style selector
     When I click "Submit" button under the media browser style selector
      And I press the "Save" button
     Then I should see image with the "Embed Flag Earth" title text
  
