Feature: Content Editing - Rich Text Editor - Convert URLs into links
  As a logged in user with a permission to use the rich text editor
  I want to add raw URLs and links in the rich text editor
  So that they will be converted to links and visitors can click on them.

  @javascript
  Scenario: Check if inserted raw URL will convert into a link when we save when
  We are using the "Visual editor" text format.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/page"
      And wait
     Then I should see "Create Basic page"
     When I select "visual_editor" from "Text format"
      And I fill in "Test convert URLs" for "Title"
      And I fill in the rich text editor field "Body" with "<p>Test line #1 <br /> Test line #2 http://drupal.org <br /> Test line #3</p>"
     Then I press "Save"
      And wait
      And I should see "Test line #1"
      And I should see "Test line #2 http://drupal.org"
      And I should see "Test line #3"
      # But the ".field.field-name-body .field-item" element should contain "Test line #1 <br /> Test line #2 <a href=\"http://drupal.org\" target=\"_blank\">http://drupal.org</a> <br /> Test line #3</p>"
     When I click "http://drupal.org" in the "a" element with the "href" attribute set to "http://drupal.org"
      And wait
     Then I should see "Drupal"