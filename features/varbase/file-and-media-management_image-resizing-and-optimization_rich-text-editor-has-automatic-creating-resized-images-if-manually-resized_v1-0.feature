Feature: File & Media Management - Image Resizing and Optimization - Rich text editor has automatic creating resized images if manually resized
  As a user with a permission to manage content
  I want to be able to have automatic resized images in rich text editor
  So that when I manually resize images inside the rich text editor images got resized automatically

  Background:
    Given I am a logged in user with the "test_super_admin" user

  # Create the Basic page and upload the file to the library before the test case.
  # ----------------------------------------------------------------------------
  # @javascript
  # Scenario: Create the "Test Basic page" content.
  #    When I go to "node/add/page"
  #     And I fill in "Test Basic page" for "Title"
  #     And I fill in the rich text editor field "Body" with "Test Basic page body"
  #     And I press the "Save" button
  #    Then I should see "Basic page Test Basic page has been created."
  #
  # Scenario: Upload the "Flag Earth" file.
  #   When I go to "admin/content/file"
  #   Then I should see "Add file"
  #   When I click "Add file"
  #   Then I should see "Upload a new file"
  #   When I attach the file "flag-earth.jpg" to "Upload a new file"
  #    And I press the "Upload" button
  #   Then I should see "flag-earth.jpg"
  #   When I press the "Next" button
  #   Then I should see "Alt Text"
  #   When I fill in "Flag Earth" for "Name *"
  #    And I fill in "Flag Earth in space" for "Alt Text"
  #    And I fill in "Flag Earth all earth in space" for "Title Text"
  #    And I press the "Save" button
  #   Then I should see "Add file"
  #    And I should see the "Edit" in the "Flag Earth" row
  # #-----------------------------------------------------------------------------
  #
  #   @javascript
  #   Scenario: Check we are able to embed existing files library in the rich text editor.
  #     When I go to "admin/content"
  #     Then I should see "Content"
  #     When I fill in "Test Basic page" for "Title"
  #      And I press the "Apply" button
  #     Then I should see "Test Basic page"
  #     When I click "Test Basic page"
  #     Then I should see "Test Basic page body"
  #     When I click "Edit"
  #     Then I should see "Edit Basic page Test Basic page"
  #     When I click on "media" command button in the rich text editor field "Body"
  #      And I wait for AJAX to finish
  #     Then I should see "Media browser"
  #      And the media browser is open
  #     When I click on the "Library" tab under the media browser
  #      And I wait for AJAX to finish
  #     Then I should see "Media browser"
  #     When I fill in "Flag Earth" for "File name" under the media browser
  #      And I press the "Apply" button under the media browser
  #     Then I should see "Flag Earth" under the media browser
  #     When I select the "Flag Earth" file under the media browser
  #      And I click "Submit" button under the media browser
  #      And I wait for AJAX to finish
  #     Then I should see "Embedding Flag Earth" under the media browser style selector
  #     When I click "Submit" button under the media browser style selector
  #      And I press the "Save" button
  #     Then I should see image with the "Flag Earth" title text


  @javascript
  Scenario: Check if changing the size of an embedded image in the rich text dose bring a resized image to the loaded page.
      When I go to "admin/content"
      Then I should see "Content"
      When I fill in "Test Basic page" for "Title"
       And I press the "Apply" button
      Then I should see "Test Basic page"
      When I click "Test Basic page"
      Then I should see "Test Basic page body"
       And I should see image with the "Flag Earth all earth in space" title text
      When I click "Edit"
      Then I should see "Edit Basic page Test Basic page"
       And I should see image with the "Flag Earth all earth in space" title text in the rich text editor field "Body"






    #  When I click on the "flag-earth.jpg" image under the "Body" field
    #   And I click on the "Image" button under the "CKEditor" for the "Body" field
    #  Then I should see "Image Properties" modal dialog
    #  When I fill in "300" for "Width" under the "Image Properties" modal dialog
    #   And I fill in "200" for "Height" under the "Image Properties" modal dialog
    #   And I press the "Ok" button under the "Image Properties" modal dialog
    #   And I press "Save" button
    #  Then I should have the "resize/styles/medium/public/flag-earth-300x200.jpg" image file in the "Test Basic page" page
