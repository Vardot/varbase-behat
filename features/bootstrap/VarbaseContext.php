<?php

use Drupal\DrupalExtension\Context\DrupalContext;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Drupal\Driver\DrupalDriver;
use Behat\MinkExtension\Context;
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
   * @Given /^I am a logged in user with (?:|the )"(?P<username>[^"]*)"(?:| user)$/
   * @Then /^I login with (?:|the )"(?P<username>[^"]*)"(?:| user)$/
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
   * @Given /^I am a logged in user with (?:|the )username "(?P<username>[^"]*)" and password "(?P<password>[^"]*)"$/
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
   * #varbase : To logout from the current session.
   *
   * Example: When I logout
   *
   * @When /^I logout$/
   */
   public function logout() {
     // Logout if I am logged in.
     if ($this->loggedIn()) {
       $this->logout();
     }
   }

  /**
   * #varbase: To go directly to an external website.
   *
   * Example: When I go to "https://www.google.com" website
   *
   * @When /^I go to "(?P<domain>[^"]*)" website$/
   */
  public function iGoToWebsite($domain) {
    $this->getSession()->visit($domain);
  }

  /**
   * #varbase: To wait for seconds before going to the next step.
   *
   * Example 1:  And wait for "1" second
   * Example 2: When I wait for "5" seconds
   * Example 3:  And wait 1 second
   * Example 4: When I wait for 60 seconds
   * Example 5:  And wait 1s
   * Example 6: When I wait for 60s
   *
   * @When /^(?:|I )wait (?:|for )"(?P<seconds>\d+)" second(?:|s)$/
   * @When /^(?:|I )wait (?:|for )(?P<seconds>\d+) second(?:|s)$/
   * @When /^(?:|I )wait (?:|for )(?P<seconds>\d+)s$/
   */
  public function iWaitForSeconds($seconds) {
    $this->getSession()->wait($seconds * 1000);
  }

  /**
   * #varbase: To wait for minutes before going to the next step
   *
   * Example 1:  And I wait for "1" minute
   * Example 2: When I wait for "2" minutes
   * Example 3:  And wait 1 minute
   * Example 4: When I wait for 3 minutes
   * Example 5:  And wait 1m
   * Example 6: When I wait for 3m
   *
   * @When /^(?:|I )wait (?:|for )"(?P<minutes>\d+)" minute(?:|s)$/
   * @When /^(?:|I )wait (?:|for )(?P<minutes>\d+) minute(?:|s)$/
   * @When /^(?:|I )wait (?:|for )(?P<minutes>\d+)m$/
   */
  public function iWaitForMinutes($minutes) {
    $this->getSession()->wait($minutes * 60 * 1000);
  }

  /**
   * #varbase : I wait max of seconds for the page to be ready and loaded.
   *
   * Exmaple 1: And wait
   * Exmaple 2: And I wait
   * Example 3: And wait for the page
   * Example 4: And I wait for the page
   * Example 5: And wait max of 5 seconds
   * Example 6: And wait max of 5s
   * Example 7: And I wait max of 5s
   * Example 8: And I wait max of "5" seconds
   * Example 9: And I wait max of "5" seconds for the page to be ready and loaded
   *
   * @Given /^(?:|I )wait max of "(?P<time>\d+)" second(?:|s)(?:| for the page to be ready and loaded)$/
   * @Given /^(?:|I )wait max of (?P<time>\d+) second(?:|s)(?:| for the page to be ready and loaded)$/
   * @Given /^(?:|I )wait max of (?P<time>\d+)s(?:| for the page to be ready and loaded)$/
   * @Given /^(?:|I )wait(?:| for the page)$/
   *
   * @throws BehaviorException If timeout is reached
   */
  public function iWaitMaxOfSecondsForThePageToBeReadyAndLoaded($time = 10000) {
      if (!$this->getSession()->getDriver() instanceof Selenium2Driver) {
          return;
      }
      $start = microtime(true);
      $end = $start + $time / 1000.0;
      $defaultCondition = true;
      $conditions = [
          "document.readyState == 'complete'",           // Page is ready
          "typeof $ != 'undefined'",                     // jQuery is loaded
          "!$.active",                                   // No ajax request is active
          "$('#page').css('display') == 'block'",        // Page is displayed (no progress bar)
          "$('.loading-mask').css('display') == 'none'", // Page is not loading (no black mask loading page)
          "$('.jstree-loading').length == 0",            // Jstree has finished loading
      ];
      $condition = implode(' && ', $conditions);
      // Make sure the AJAX calls are fired up before checking the condition
      $this->getSession()->wait(100, false);
      $this->getSession()->wait($time, $condition);
      // Check if we reached the timeout unless the condition is false to explicitly wait the specified time
      if ($condition !== false && microtime(true) > $end) {
        throw new BehaviorException(sprintf('Timeout of %d reached when checking on %s', $time, $condition));
      }
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
   * #varbase : To press a button in the filter form under the media browser.
   *
   * Example 1: When I press the "Apply" button under the media browser
   * Example 2: When I press the "Submit" button under the media browser
   *
   * @When /^I press (?:|the )"([^"]*)" button under the media browser$/
   */
  public function iPressTheButtonUnderTheMediaBrowser($button) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');


      try {
        $this->getSession()->wait(1000, 'typeof(jQuery)=="undefined" || jQuery("#autocomplete").length === 0');
      }
      catch (UnsupportedDriverActionException $e) {

      }

    $this->getSession()->getPage()->pressButton($button);

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
   * #varbase : To click on a media browser
   *
   * Example 1: When I click "Submit" button under the media browser
   * Example 2: When I click "Submit" under media browser
   * Example 3: When I click "Upload" under the media browser
   *
   * @When /^I click "([^"]*)" (?:|button )under (?:|the )media browser$/
   */
  public function iClickButtonUnderTheMediaBrowser($text) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');

    // Find the Tab by txt
    $element = $this->getSession()->getPage()->find('xpath', "//*[contains(@class, 'button') and text() = '{$text}']");

    if (empty($element)) {
      throw new Exception('The media browser dose not have [ ' . $text . ' ] button.');
    }

    $element->click();

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
   * #varbase : To click on a media browser style selector
   *
   * Example 1: When I click "Submit" button under the media browser style selector
   * Example 2: When I click "Submit" under media browser style selector
   * Example 3: When I click "Submit" under the media browser style selector
   *
   * @When /^I click "([^"]*)" (?:|button )under (?:|the )media browser style selector$/
   */
  public function iClickButtonUnderTheMediaBrowserStyleSelector($text) {
    // Switch to the "mediaStyleSelector" iframe.
    $this->getSession()->switchToIFrame('mediaStyleSelector');

    // Find the Tab by txt
    $element = $this->getSession()->getPage()->find('xpath', "//*[contains(@class, 'button') and text() = '{$text}']");

    if (empty($element)) {
      throw new Exception('The media browser dose not have [ ' . $text . ' ] button.');
    }

    $element->click();

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
   * #varbase : To click on a media browser tab.
   *
   * Example 1: When I click on the "Library" tab under the media browser
   * Example 2: When I click on the "My files" tab under the media browser
   *
   * @When /^I click on the "([^"]*)" tab under the media browser$/
   */
  public function iClickOnTheTabUnderTheMediaBrowser($text) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');

    // Find the Tab by txt
    $element = $this->getSession()->getPage()->find('xpath', "//*[contains(@class, 'ui-tabs-anchor') and text() = '{$text}']");

    if (empty($element)) {
      throw new Exception('The media browser dose not have [ ' . $text . ' ] tab.');
    }

    $element->click();

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
   * #varbase : To click on a media browser File.
   *
   * Example 1: When I click on the "Flag Earth" file under the media browser
   *
   * @When /^I select (?:|the )"([^"]*)" file under (?:|the )media browser$/
   */
  public function iSelectTheFileUnderTheMediaBrowser($text) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');

    // Find the file by text.
    $element = $this->getSession()->getPage()->find('xpath', "//div[contains(@class, 'media-item') and contains(@title, '{$text}')]");

    if (empty($element)) {
      throw new Exception('The media browser dose not have [ ' . $text . ' ] file.');
    }

    $element->click();

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
  * #varbase : To fill in a form field with id|name|title|alt|value
  *            under the media browser.
  *
  * Example: I fill in "flag earth" for "File name" under the media browser
  *
  * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with "(?P<value>(?:[^"]|\\")*)" under (?:|the )media browser$/
  * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with: under (?:|the )media browser$/
  * @When /^(?:|I )fill in "(?P<value>(?:[^"]|\\")*)" for "(?P<field>(?:[^"]|\\")*)" under (?:|the )media browser$/
  */
  public function iFillInFieldUnderTheMediaBrowser($field, $value) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');

    $field = str_replace('\\"', '"', $field);
    $value = str_replace('\\"', '"', $value);
    $this->getSession()->getPage()->fillField($field, $value);

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
  * #varbase : To fill in a form field with id|name|title|alt|value
  *            under the media browser style selector.
  *
  * Example: I fill in "flag earth" for "File name" under the media browser style selector
  *
  * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with "(?P<value>(?:[^"]|\\")*)" under (?:|the )media browser style selector$/
  * @When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with: under (?:|the )media browser style selector$/
  * @When /^(?:|I )fill in "(?P<value>(?:[^"]|\\")*)" for "(?P<field>(?:[^"]|\\")*)" under (?:|the )media browser style selector$/
  */
  public function iFillInFieldUnderTheMediaBrowserStyleSelector($field, $value) {
    // Switch to the "mediaStyleSelector" iframe.
    $this->getSession()->switchToIFrame('mediaStyleSelector');

    $field = str_replace('\\"', '"', $field);
    $value = str_replace('\\"', '"', $value);
    $this->getSession()->getPage()->fillField($field, $value);

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
  * #varbase : To check if we can see a text
  *            under the media browser.
  *
  * Example 1: Then I should see "this text" under media browser
  * Example 2: Then I should see "this text" under the media browser modal window
  *
  * @Then /^I should see "([^"]*)" under (?:|the )media browser(?:| modal window)$/
  */
  public function iShouldSeeTextUnderTheMediaBrowser($text) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');

    $actual = $this->getSession()->getPage()->getText();
    $actual = preg_replace('/\s+/u', ' ', $actual);
    $regex = '/'.preg_quote($text, '/').'/ui';

    if (!preg_match($regex, $actual)) {
      throw new Exception(sprintf('The text "%s" was not found anywhere in the text of the current page.', $text));
    }

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

   /**
   * #varbase : To check if we can see a text
   *            under the media browser style selector.
   *
   * Example 1: Then I should see "this text" under media browser style selector
   * Example 2: Then I should see "this text" under the media browser style selector modal window
   *
   * @Then /^I should see "([^"]*)" under (?:|the )media browser style selector(?:| modal window)$/
   */
  public function iShouldSeeTextUnderTheMediaBrowserStyleSelector($text) {
    // Switch to the "mediaStyleSelector" iframe.
    $this->getSession()->switchToIFrame('mediaStyleSelector');

    $actual = $this->getSession()->getPage()->getText();
    $actual = preg_replace('/\s+/u', ' ', $actual);
    $regex = '/'.preg_quote($text, '/').'/ui';

    if (!preg_match($regex, $actual)) {
      throw new Exception(sprintf('The text "%s" was not found anywhere in the text of the current page.', $text));
    }

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

   /**
   * #varbase : To check if we can NOT see a text
   *            under the media browser.
   *
   * Example 1: Then I should not see "this text" under media browser
   * Example 2: Then I should not see "this text" under the media browser modal window
   *
   * @Then /^I should not see "([^"]*)" under (?:|the )media browser(?:| modal window)$/
   */
  public function iShouldNotSeeTextUnderTheMediaBrowser($text) {
    // Switch to the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame('mediaBrowser');

    $actual = $this->getSession()->getPage()->getText();
    $actual = preg_replace('/\s+/u', ' ', $actual);
    $regex = '/'.preg_quote($text, '/').'/ui';

    if (preg_match($regex, $actual)) {
      throw new Exception(sprintf('The text "%s" was not found anywhere in the text of the current page.', $text));
    }

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
  }

  /**
   * @Then /^I should not see "([^"]*)" under the media browser style selector$/
   */


   /**
   * #varbase : To check if we can NOT see a text
   *            under the media browser style selector.
   *
   * Example 1: Then I should not see "this text" under media browser style selector
   * Example 2: Then I should not see "this text" under the media browser style selector modal window
   *
   * @Then /^I should not see "([^"]*)" under (?:|the )media browser style selector(?:| modal window)$/
   */
  public function iShouldNotSeeTextUnderTheMediaBrowserStyleSelector($text) {
    // Switch to the "mediaStyleSelector" iframe.
    $this->getSession()->switchToIFrame('mediaStyleSelector');

    $actual = $this->getSession()->getPage()->getText();
    $actual = preg_replace('/\s+/u', ' ', $actual);
    $regex = '/'.preg_quote($text, '/').'/ui';

    if (preg_match($regex, $actual)) {
      throw new Exception(sprintf('The text "%s" was not found anywhere in the text of the current page.', $text));
    }

    // Switch back too the page from the "mediaBrowser" iframe.
    $this->getSession()->switchToIFrame(null);
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



  // Images Functions.
  // ===========================================================================

  /**
   * #varbase : To Find an image with the title text attribute.
   *
   * Example 1: Then I should see image with the "Flag Earth" title text
   *
   * @Then /^I should see image with the "([^"]*)" title text$/
   */
  public function iShouldSeeImageWithTheTitleText($titleText) {
    // Find an image with the title.
    $element = $this->getSession()->getPage()->find('xpath', "//img[contains(@title, '{$titleText}')]");

    if (empty($element)) {
      throw new Exception('The page dose not have an image with the [ ' . $titleText . ' ] title text.');
    }
  }

  /**
   * #varbase : To Find an image with the alt text attribute.
   *
   * Example 1: Then I should see image with the "Flag Earth" alt text
   *
   * @Then /^I should see image with the "([^"]*)" alt text$/
   */
  public function iShouldSeeImageWithTheAltText($altText) {
    // Find an image with the title.
    $element = $this->getSession()->getPage()->find('xpath', "//img[contains(@alt, '{$altText}')]");

    if (empty($element)) {
      throw new Exception('The page dose not have an image with the [ ' . $altText . ' ] Alt Text.');
    }
  }

  /**
   * #varbase : To Find an image with the title text attribute
   *            under a custom iframe.
   *
   * Example 1: Then I should see image with the "Flag Earth" title text in the rich text editor field "Body"
   *
   * @Then /^I should see image with the "([^"]*)" title text in the rich text editor field "([^"]*)"$/
   */
  // public function iShouldSeeImageWithTheTitleTextInTheRichTextEditorField($titleText, $locator) {
  //
  //   $el = $this->getSession()->getPage()->findField($locator);
  //   $fieldId = $el->getAttribute('id');
  //
  //   if (empty($fieldId)) {
  //     throw new Exception('Could not find an id for the rich text editor field : ' . $locator);
  //   }
  //
  //   $CKEditorContent = $this->getSession()->executeScript("return CKEDITOR.instances[\"$fieldId\"].getData();");
  //
  //
  //   // Switch to the iframe.
  //   $iFreamID = $this->_getAttributeByOtherAttributeValue('id', 'title', $filedName, 'iframe');
  //   $this->getSession()->switchToIFrame($iFreamID);
  //
  //   // Find an image with the title.
  //   $element = $this->getSession()->getPage()->findAll('xpath', "//img[contains(@title, '{$titleText}')]");
  //
  //   if (empty($element)) {
  //     throw new Exception('The page dose not have an image with the [ ' . $titleText . ' ] title text under [ '. $filedName .' ].');
  //   }
  //
  //   // Switch back too the page from the iframe.
  //   $this->getSession()->switchToIFrame(null);
  // }

  /**
   * #varbase : To Find an image with the alt text attribute.
   *            under a custom iframe.
   *
   * Example 1: Then I should see image with the "Flag Earth" alt text in the rich text editor field "Body"
   *
   * @Then /^I should see image with the "([^"]*)" alt text in the rich text editor field "([^"]*)"$/
   */
  public function iShouldSeeImageWithTheAltTextUnder($altText, $filedName) {
    // Switch to the iframe.
    $iFreamID = $this->_getAttributeByOtherAttributeValue('id', 'title', $filedName, 'iframe');
    $this->getSession()->switchToIFrame($iFreamID);

    // Find an image with the title.
    $element = $this->getSession()->getPage()->find('xpath', "//img[contains(@alt, '{$altText}')]");

    if (empty($element)) {
      throw new Exception('The page dose not have an image with the [ ' . $altText . ' ] Alt Text under [ '. $filedName .' ].');
    }

    // Switch back too the page from the iframe.
    $this->getSession()->switchToIFrame(null);
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

}
