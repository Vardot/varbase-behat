Feature: File & Media Management - Assets Management - Files and their usage list page for admins
  As a user with permission to manage files in the site
  I want to be able to see the list of files
  So that I will be able to manage files, see where they have been used in contents.

  Background:
    Given I am a logged in user with the "test_site_admin" user

  @javascript @DEV @STG @PROD
  Scenario: Check if content admins can access the content files page.
     When I go to "admin/content/file"
     Then I should see "Add file"
      And I should not see "Access denied"

  @javascript @DEV @STG @PROD
  Scenario: Check if content admins can access the Thumbnails view of files.
     When I go to "admin/content/file/thumbnails"
     Then I should see "Add file"
      And I should not see "Access denied"

  @javascript @DEV @STG @PROD
  Scenario: Check if we do have a file named "Flag Earth" , if not then upload the file dependently.
     When I go to "admin/content/file"
     Then I should see "Add file"
     When I click "Add file"
     Then I should see "Upload a new file"
     When I attach the file "flag-earth.jpg" to "Upload a new file"
      And I press the "Upload" button
      And I wait
     Then I should see "flag-earth.jpg"
     When I press the "Next" button
     Then I should see "Alt Text"
     When I fill in "Flag Earth" for "Name *"
      And I fill in "Flag Earth in space" for "Alt Text"
      And I fill in "Flag Earth all earth in space" for "Title Text"
      And I press the "Save" button
     Then I should see "Add file"
      And I should see the "Edit" in the "Flag Earth" row

  @javascript @DEV @STG @PROD
  Scenario: Check if content admins can edit files.
     When I go to "admin/content/file"
     Then I should see "Add file"
     When I fill in "Flag Earth" for "Name"
      And I press the "Apply" button
     Then I should see "Flag Earth"
     When I click "Edit"
     Then I should see "Edit image Flag Earth"
     When I fill in "Flag Earth after edit" for "Name *"
      And I press the "Save" button
     Then I should see "Image Flag Earth after edit has been updated."
      And I should see "Edit" in the "Flag Earth after edit" row

  @javascript @DEV @STG @PROD
  Scenario: Check if content admins can delete files.
     When I go to "admin/content/file"
     Then I should see "Add file"
     When I fill in "Flag Earth after edit" for "Name"
      And I press the "Apply" button
     Then I should see "Flag Earth after edit"
     When I click "Delete"
     Then I should see "Are you sure you want to delete the file Flag Earth after edit?"
     When I press the "Delete" button
     Then I should see "Image Flag Earth after edit has been deleted."
