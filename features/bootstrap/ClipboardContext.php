<?php

use Behat\Behat\Tester\Exception\PendingException;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class ClipboardContext extends RawDrupalContext implements SnippetAcceptingContext {

  protected $copiedClipboard;

  /**
   * #vardot : Move the focus to selected field input element.
   *
   * Example #1: When I move focus to "Title" field
   * Example #2:  And I move focus to "Body" field
   *
   * @When /^(?:|I )move focus to "(?P<selectedField>[^"]*)" field$/
   */
  function moveFocusToField($selectedField) {
    $field = $this->getSession()->getPage()->findField($selectedField);
    $fieldid = $field->getAttribute('id');
    $this->getSession()->getDriver()->evaluateScript("jQuery('#{$fieldid}').focus();");
  }

 /**
  * #vardot : Select all text in selected field input element.
  *
  * Example #1: When I select all text in "Title" field
  * Example #2:  And I select all text in "Description" field
  *
  * @When /^(?:|I )select all text in "(?P<selectedField>[^"]*)" field$/
  */
 function selectAllTextInField($selectedField) {
   $field = $this->getSession()->getPage()->findField($selectedField);
   $fieldid = $field->getAttribute('id');
   $this->getSession()->getDriver()->evaluateScript('document.getElementById("'. $fieldid .'").select();');
 }

 /**
  * #vardot : Select part of the text in selected field input element.
  *
  * Example #1: When I select from 0 to 5 text in "Title" field
  * Example #2:  And I select from 0 to 5 text in "Description" field
  *
  * @When /^(?:|I )select from (?P<from>\d+) to (?P<to>\d+) text in "(?P<selectedField>[^"]*)" field$/
  */
 function setSelectionRangeFromField($from, $to, $selectedField) {
   $field = $this->getSession()->getPage()->findField($selectedField);
   $fieldid = $field->getAttribute('id');

   if ($from < 0) {
     $from = 0;
   }

   if ($to === 0) {
     $to = $field->getValue()->length();
   }

   $this->getSession()->getDriver()->evaluateScript('document.getElementById("'. $fieldid .'").setSelectionRange(' . $from . ',' . $to . ');');
 }

 /**
  * #vardot : Select a part text in selected field input element.
  *
  * Example #1: When I select "title name" text in "Title" field
  * Example #2:  And I select "some content" text in "Description" field
  *
  * @When /^(?:|I )select "(?P<selectedText>[^"]*)" text in "(?P<selectedField>[^"]*)" field$/
  */
 function selectTextInField($selectedText, $selectedField) {
   $field = $this->getSession()->getPage()->findField($selectedField);
   $fieldid = $field->getAttribute('id');

   // Get the value of the selected field.
   $fieldValue = $field->getValue();

   // Have the $selectionStart.
   $selectionStart = strpos($fieldValue, $selectedText);
   if (empty($selectionStart)) {
     throw new Exception(sprintf('We do not have "%s" in the "%s" field.', $selectedText, $selectedField));
   }

   // Have the selectionEnd.
   $selectionEnd = $selectionStart + strlen($selectedText);

   $this->getSession()->getDriver()->evaluateScript('document.getElementById("'. $fieldid .'").setSelectionRange(' . $selectionStart . ',' . $selectionEnd . ');');
 }

 /**
  * #vardot : set a text value in the clipboard text
  *
  * Example: Gavin I set "(?P<text>[^"]*) to clipboard text
  *
  * @Gavin /^(?:|I )set "(?P<text>[^"]*) to clipboard text$/
  */
 function setTextToClipboard($text) {
   $this->getSession()->getDriver()->evaluateScript("clipboard.setData('text/plain', '". $text ."');");
 }

  /**
   * #varbase : To Copy selected text to clipboard text
   *
   * Example: When I copy selected text to clipboard text
   *
   * @When /^(?:|I )copy selected text to clipboard text$/
   */
  function copySelectedToClipboard() {
    $this->getSession()->getDriver()->evaluateScript('document.execCommand("copy");');
  }

  /**
   * #varbase: To Cut selected text to clipboard text
   *
   * Example: When I cut selected text to clipboard text
   *
   * @When /^(?:|I )cut selected text to clipboard text$/
   */
  function cutSelectedToClipboard() {
    $this->getSession()->getDriver()->evaluateScript('document.execCommand("cut");');
  }

  /**
  * #varbase : To fill in a form field with id|name|title|alt|value
  *            From the clipboard Text.
  *
  * Example #1: I fill in "Title" from clipboard text
  * Example #2: I fill in from clipboard text for "Title"
  *
  * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" from clipboard text$/
  * @When /^(?:|I )fill in from clipboard text for "(?P<field>(?:[^"]|\\")*)"$/
  */
  public function iFillInFieldFromClipboardText($field) {
    $field = str_replace('\\"', '"', $field);
    $value = $this->getSession()->getDriver()->evaluateScript("return clipboard.getData('text/plain');");
    $this->getSession()->getPage()->fillField($field, $value);
  }




  /**
   * #vardot : Move the focus to selected field input element.
   *
   * Example #1: When I move focus to "Title" field
   * Example #2:  And I move focus to "Body" field
   *
   * @When /^(?:|I )move focus to "(?P<selectedField>[^"]*)" rich text editor field$/
   */
  function moveFocusToTheRichTextEditorField($selectedField) {
    $el = $this->getSession()->getPage()->findField($selectedField);
    $fieldid = $el->getAttribute('id');

    if ($fieldid != NULL && $fieldid != '') {
      $this->_addIDtoIFrame($fieldid, 'ifream-');
    }


    if (empty($fieldid)) {
     throw new Exception('Could not find an id for the rich text editor field : ' . $selectedField);
    }

   $this->getSession()->getDriver()->evaluateScript('CKEDITOR.instances[\"$fieldId\"].focus();');
  }

  /**
  * #vardot : Select all text in selected field input element.
  *
  * Example #1: When I select all text in "Body" field
  * Example #2:  And I select all text in "Body" field
  *
  * @When /^(?:|I )select all text in "(?P<selectedField>[^"]*)" rich text editor field$/
  */
  function selectAllTextInTheRichTextEditorField($selectedField) {
    $el = $this->getSession()->getPage()->findField($selectedField);
    $fieldid = $el->getAttribute('id');

    if ($fieldid != NULL && $fieldid != '') {
      $this->_addIDtoIFrame($fieldid, 'ifream-');
    }


    if (empty($fieldid)) {
     throw new Exception('Could not find an id for the rich text editor field : ' . $selectedField);
    }


    // Switch to the "CKEDITOR" iframe.
    $this->getSession()->switchToIFrame('ifream-' . $fieldid);


    $this->getSession()->getDriver()->evaluateScript('document.body.select();');


    // Switch back too the page from the "CKEDITOR" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
  * #vardot : Select part of the text in selected field input element.
  *
  * Example #1: When I select from 0 to 5 text in "Body" field
  * Example #2:  And I select from 0 to 5 text in "Body" field
  *
  * @When /^(?:|I )select from (?P<from>\d+) to (?P<to>\d+) text in "(?P<selectedField>[^"]*)" rich text editor field$/
  */
  function setSelectionRangeFromTheRichTextEditorField($from, $to, $selectedField) {
    $el = $this->getSession()->getPage()->findField($selectedField);
    $fieldid = $el->getAttribute('id');

    if ($fieldid != NULL && $fieldid != '') {
      $this->_addIDtoIFrame($fieldid, 'ifream-');
    }


    if (empty($fieldid)) {
     throw new Exception('Could not find an id for the rich text editor field : ' . $selectedField);
    }

   if ($from < 0) {
     $from = 0;
   }

   if ($to === 0) {
     $to = $el->getValue()->length();
   }

   $this->getSession()->getDriver()->evaluateScript('CKEDITOR.instances[\"$fieldId\"].setSelectionRange(' . $from . ',' . $to . ');');
  }

  /**
  * #vardot : Select a part text in selected field input element.
  *
  * Example #1: When I select from 0 to 5 text in "Body" field
  * Example #2:  And I select from 0 to 5 text in "Body" field
  *
  * @When /^(?:|I )select "(?P<selectedText>[^"]*)" text in "(?P<selectedField>[^"]*)" rich text editor field$/
  */
  function selectTextInTheRichTextEditorField($selectedText, $selectedField) {
    $el = $this->getSession()->getPage()->findField($selectedField);
    $fieldid = $el->getAttribute('id');

    if ($fieldid != NULL && $fieldid != '') {
      $this->_addIDtoIFrame($fieldid, 'ifream-');
    }


    if (empty($fieldid)) {
     throw new Exception('Could not find an id for the rich text editor field : ' . $selectedField);
    }

    // Switch to the "CKEDITOR" iframe.
    $this->getSession()->switchToIFrame($fieldid);

    $field = $this->getSession()->getPage()->findField(".cke_editable cke_editable_themed");
    $ckefieldid = $field->getAttribute('id');

    // Get the value of the selected field.
    $fieldValue = $field->getValue();


   // Have the $selectionStart.
   $selectionStart = strpos($fieldValue, $selectedText);
   if (empty($selectionStart)) {
     throw new Exception(sprintf('We do not have "%s" in the "%s" field.', $selectedText, $selectedField));
   }

   // Have the selectionEnd.
   $selectionEnd = $selectionStart + strlen($selectedText);

   $this->getSession()->getDriver()->evaluateScript('CKEDITOR.instances[\"$fieldId\"].setSelectionRange(' . $selectionStart . ',' . $selectionEnd . ');');

   // Switch back too the page from the "CKEDITOR" iframe.
   $this->getSession()->switchToIFrame(null);
  }

  /**
   * Helper function to let you get the value of an attribute name for
   * an HTML tag by other Attribute name and value
   *
   * @param  string $attributeName       The attribute name.
   * @param  string $otherAttributeName  other attribute name.
   * @param  string $otherAttributeValue other attribute value.
   * @param  string $htmlTagName         the HTML tag name you are filtring with.
   * @return string                      Attribute value for the first matching element.
   */
  private function _getAttributeByOtherAttributeValue($attributeName, $otherAttributeName, $otherAttributeValue, $htmlTagName = "*") {
    $element = $this->getSession()->getPage()->find('xpath', "//{$htmlTagName}[contains(@{$otherAttributeName}, '{$otherAttributeValue}')]");
    return $element->getAttribute($attributeName);
  }

  private function _updateIDByCSS($htmlTagCSS, $htmlTagID, $prefix = '') {
    $this->getSession()->getDriver()->evaluateScript('jQuery("' . $htmlTagCSS . '").attr("id", "'. $prefix . $htmlTagID. '");');
  }

  private function _addIDtoIFrame($fieldid, $prefix = "ifream-") {
    // If the WYSIWYG is in an ifream with no id.
    $iFreamID = $this->_getAttributeByOtherAttributeValue('id', 'title', "Rich Text Editor, ". $fieldid, 'iframe');
    if (empty($iFreamID)) {
      $ifreamcss = $this->_getAttributeByOtherAttributeValue('class', 'title', "Rich Text Editor, ". $fieldid, 'iframe');
      $ifreamcss = str_replace(" ", ".", $ifreamcss);
      if (strpos($ifreamcss, ".") > 1) {
        $ifreamcss = '.' . $ifreamcss;
      }
      $this->_updateIDByCSS($ifreamcss, $fieldid, $prefix);
    }
  }
}
