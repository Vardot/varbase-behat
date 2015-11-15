<?php

use Drupal\DrupalExtension\Context\DrupalContext;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Drupal\Driver\DrupalDriver;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

/**
 * Defines application features from the specific context.
 */
class VarbaseContext extends RawDrupalContext {

  /**
  * Hold the user name and password from drupal_users parameters.
  */
  protected $users;

  /**
  * Hold the user name and password from varbase_users parameters.
  */
  protected $varbase_users;

  /**
   * Initializes context.
   *
   * @param array $parameters .
   *   Context parameters (set them up through behat.yml or behat.local.yml).
   */
  public function __construct(array $parameters) {

    if (isset($parameters['varbase_users'])) {
      $this->varbase_users = $parameters['varbase_users'];
      foreach ($parameters['varbase_users'] as $varbase_username => $varbase_user) {
        $this->users[$varbase_username] = $varbase_user['password'];
      }
    }
    else {
      throw new Exception('behat.varbase.yml should include "varbase_users" property.');
    }
  }

  /**
   * Authenticates a user with password from varbase configuration.
   *
   * @Given /^I am a logged in user with the "([^"]*)" user$/
   */
  public function iAmloggedInUserWithTheUser($username) {

    try {
      $password = $this->users[$username];
    }
    catch (Exception $e) {
      throw new Exception("Password not found for '$username'.");
    }
    if ($this->loggedIn()) {
      $this->logout();
    }
    $element = $this->getSession()->getPage();
    $this->getSession()->visit($this->locatePath('/user'));
    $element->fillField('Username', $username);
    $element->fillField('Password', $password);
    $submit = $element->findButton('Log in');
    $submit->click();
  }

  //  To wait for "secounds" of time.
  //  Example 1: I wait for "1 second"
  //  Example 2: I wait for "10 secounds"
  /**
   * @When /^I wait for "([^"]*)"$/
   */
  public function iWaitFor($time) {
    $this->getSession()->wait($time * 1000);
  }

  // Media Browser functions
  /**
   * @When /^I wait "([^"]*)" for the media browser to open$/
   */
  public function iWaitForTheMediaBrowserToOpen($time) {
    $this->getSession()->wait($time * 1000);
    if (!$elem = $this->getSession()->getPage()->find('css', '.ui-dialog.media-wrapper') || !$this->getSession()->getPage()->find('css', '.ui-dialog.media-wrapper .media-browser-panes')) {
      throw new Exception('The media browser failed to open.');
    }
  }

  /**
   * @When /^I click on "([^"]*)" button in the media browser$/
   */
  public function iClickOnButtonInTheMediaBrowser($text) {
    $element = $this->getSession()->getPage()->find('xpath', "//*[contains(@class, 'media-browser-button') and text() = '{$text}']");
    $element->click();
  }

  // Rich text editor Functions CKEditor.

  /**
   * @When /^I fill in the rich text editor field "([^"]*)" with "([^"]*)"$/
   */
  public function iFillInTheRichTextEditorField($locator, $value) {
    $el = $this->getSession()->getPage()->findField($locator);
    $fieldId = $el->getAttribute('id');

    if (empty($fieldId)) {
      throw new Exception('Could not find an id for the rich text editor field : ' . $locator);
    }

    $this->getSession()->executeScript("CKEDITOR.instances[\"$fieldId\"].setData(\"$value\");");
  }

  /**
   * @When /^I click on "([^"]*)" command button in the rich text editor field "([^"]*)"$/
   */
  public function iClickOnCommandButtonInTheRichTextEditorField($selectorCommand, $locator) {

    $el = $this->getSession()->getPage()->findField($locator);
    $fieldId = $el->getAttribute('id');

    if (empty($fieldId)) {
      throw new Exception('Could not find an id for the rich text editor field : ' . $locator);
    }

    $this->getSession()->executeScript("CKEDITOR.instances[\"$fieldId\"].execCommand( '$selectorCommand' );");
  }

  public function cleanUsers() {

  }

}
