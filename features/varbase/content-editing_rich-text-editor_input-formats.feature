Feature: Content Editing - Rich Text Editor - Input formats
  As a logged in user with a permission to edit content
  I want to be able to switch between input formats
  So that can use different type of rich text editors.

  @javascript
  Scenario: Check if Site Admin user can change the text format for the body of Basic page.
    Given I am a logged in user with the "test_site_admin"
     When I go to "/node/add/page"
      And wait
     Then I should see "Create Basic page"
      And I should see "Body"
      And I should see "Text format"
      And I should not see "HTML Editor"

     When I select "visual_editor" from "Text format"
      And I wait for AJAX to finish
     Then I should see the "#cke_edit-body-und-0-value" element in the "field body"
      And I should see the "#cke_edit-body-und-0-value .cke_button__image" element in the "field body"

     When I select "basic_editor" from "Text format"
      And I wait for AJAX to finish
     Then I should see the "#cke_edit-body-und-0-value" element in the "field body"
      And I should not see the "#cke_edit-body-und-0-value .cke_button__image" element in the "field body"

     When I select "plain_text" from "Text format"
      And I wait for AJAX to finish
     Then I should see the "#edit-body-und-0-value" element in the "field body"
      And I should not see the "#cke_edit-body-und-0-value" element in the "field body"
      And I should not see the "#edit-body-und-0-value-aced" element in the "field body"

   @javascript
   Scenario: Check if Super Admin user can change the text format for the body of Basic page.
     Given I am a logged in user with the "test_super_admin"
      When I go to "/node/add/page"
       And wait
      Then I should see "Create Basic page"
       And I should see "Body"
       And I should see "Text format"

      When I select "visual_editor" from "Text format"
       And I wait for AJAX to finish
      Then I should see the "#cke_edit-body-und-0-value" element in the "field body"
       And I should see the "#cke_edit-body-und-0-value .cke_button__image" element in the "field body"

      When I select "basic_editor" from "Text format"
       And I wait for AJAX to finish
      Then I should see the "#cke_edit-body-und-0-value" element in the "field body"
       And I should not see the "#cke_edit-body-und-0-value .cke_button__image" element in the "field body"

      When I select "plain_text" from "Text format"
       And I wait for AJAX to finish
      Then I should see the "#edit-body-und-0-value" element in the "field body"
       And I should not see the "#cke_edit-body-und-0-value" element in the "field body"
       And I should not see the "#edit-body-und-0-value-aced" element in the "field body"

       When I select "html_editor" from "Text format"
        And I wait for AJAX to finish
       Then I should see the "#edit-body-und-0-value-aced" element in the "field body"
        And I should not see the "#cke_edit-body-und-0-value" element in the "field body"
