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
   * #varbase : To authenticat a user with password from varbase configuration.
   *            If you want to see the list of users or add yours you can go and
   *            edit the behat.varbase.yml file under the varbase_users list.
   *
   * Example: I am a logged in user with the username "test_content_admin"
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

  /**
   * #varbase : To authenticat a user with a gavin username and password on the spot.
   *
   * Example: I am a logged in user with the username "testing" and password "testing user password"
   *
   * @Given /^I am a logged in user with the username "([^"]*)" and password "([^"]*)"$/
   */
  public function iAmLoggedInUserWithTheUsernameAndPassword($username, $password) {
    // Logout if I am logged in.
    if ($this->loggedIn()) {
      $this->logout();
    }

    // Login with the
    $element = $this->getSession()->getPage();
    $this->getSession()->visit($this->locatePath('/user'));
    $element->fillField('Username', $username);
    $element->fillField('Password', $password);
    $submit = $element->findButton('Log in');
    $submit->click();
  }

  /**
   * #varbase: To go directly to an external website.
   *
   * Example: When I go to "https://www.google.com" website
   *
   * @When /^I go to "([^"]*)" website$/
   */
  public function iGoToWebsite($domain) {
    $this->getSession()->visit($domain);
  }

  /**
   * #varbase: To wait for time before going to the next step
   *
   * Example 1: I wait for "1 second"
   * Example 2: I wait for "10 secounds"
   *
   * @When /^I wait for "([^"]*)"$/
   */
  public function iWaitFor($time) {
    $this->getSession()->wait($time * 1000);
  }

  // Media Browser functions
  // ===========================================================================
  /**
   * @Then /^the media browser is open$/
   */
  public function theMediaBrowserIsOpen() {
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

  /**
   * @When /^I click on the "([^"]*)" tab in the media browser$/
   */
  public function iClickOnTheTabInTheMediaBrowser($xpath) {
    $element = $this->getSession()->getPage()->find(
     'xpath',
     $this->getSession()->getSelectorsHandler()->selectorToXpath('xpath', $xpath)
    );

    if (null === $element) {
      throw new \InvalidArgumentException(sprintf('The media browser dose not have this tab "%s"', $xpath));
    }

    $element->click();
  }
  // ===========================================================================


  // Rich text editor Functions CKEditor.
  // ===========================================================================

  /**
  * #varbase : To fill in a rich text editor field  WYSIWYG with content
  *            using the name of the field.
  *
  *  Example: When I fill in the rich text editor field "Body" with "Test Body text"
  *
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
   * #varbase : To click a command button in the rich text editor
   *  Example 1: When I click on "bold" command button in the rich text editor field "Body"
   *  Exmaple 2: When I click on "media" command button in the rich text editor field "Body"
   *
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
  // ===========================================================================

  // Mouse Functions.
  // ===========================================================================
   /**
   * #varbase: To move the mouse over an element.
   *
   * Example: When I move the mouse over "header#navbar #main_menu ul.nav li a"
   *
   * @When /^I move the mouse over the "([^"]*)"$/
   */
  public function iMouseOver($selector) {
    $elem = $this->getSession()->getPage()->find('css', $selector);
    if ($elem) {
      $elem->mouseOver();
    }
    else {
      throw new Exception("No element matching \"$selector\" is found.");
    }
  }

  /**
  * #varbase: To double click on an element.
  *
  * Example: When I move the mouse over "#select .option-switch"
  *
  * @When /^I double click "([^"]*)"$/
  */
  public function iDoubleClick($selector) {
    $elem = $this->getSession()->getPage()->find('css', $selector);
    if ($elem) {
     $elem->doubleClick();
    }
    else {
     throw new Exception("No element matching \"$selector\" is found.");
    }
  }

  /**
  * #varbase: To right click on an element.
  *
  * Example: When I move the mouse over "#right-click-to-configure a"
  *
  * @When /^I right click "([^"]*)"$/
  */
  public function iRightClick($selector) {
    $elem = $this->getSession()->getPage()->find('css', $selector);
    if ($elem) {
      $elem->rightClick();
    }
    else {
      throw new Exception("No element matching \"$selector\" is found.");
    }
  }
  // ===========================================================================


  public function cleanUsers() {

  }

}
