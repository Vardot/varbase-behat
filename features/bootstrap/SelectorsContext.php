<?php

use Behat\Behat\Tester\Exception\PendingException;
use Drupal\DrupalExtension\Context\RawDrupalContext;
use Behat\Behat\Context\SnippetAcceptingContext;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

use Behat\Mink\Selector\CssSelector;
use Behat\Mink\Selector\NamedSelector;
use Behat\Mink\Exception\ExpectationException;

use Behat\Behat\Hook\Scope\BeforeScenarioScope;

/**
 * Defines application features from the specific context.
 */
class SelectorsContext extends RawDrupalContext implements SnippetAcceptingContext {

  protected $cssSelectors;
  protected $xpathSelectors;

  /**
   * Initializes context.
   *
   * Every scenario gets its own context instance.
   * You can also pass arbitrary arguments to the
   * context constructor through behat.yml.
   */
  public function __construct(array $parameters) {

    if (isset($parameters['selectors'])) {
      if (isset($parameters['selectors']['css']) || isset($parameters['selectors']['xpath'])) {

       if (isset($parameters['selectors']['css']) && count($parameters['selectors']['css'])) {
        $this->cssSelectors = $parameters['selectors']['css'];
       }

       if (isset($parameters['selectors']['xpath']) && count($parameters['selectors']['xpath'])) {
        $this->xpathSelectors = $parameters['selectors']['xpath'];
       }
      }
      else {
        throw new Exception('behat.yml should include "selectors" with css or xpath property. under SelectorsContext');
      }
    }
  }

  /**
   * @BeforeScenario
   */
  public function registorSelectors(BeforeScenarioScope $scope) {

     $selectorHandler = $this->getSession()->getSelectorsHandler()->getSelector('named');

     // Register selector name for all CSS selectors.
     $css = new CssSelector();
     foreach ($this->cssSelectors as $name => $selector) {
       $selectorHandler->registerNamedXpath($name, $css->translateToXPath($selector));
     }

     // Registor selector name for all XPath selectors.
     foreach ($this->xpathSelectors as $name => $selector) {
       $selectorHandler->registerNamedXpath($name, $selector);
     }
   }

    /**
    * #Selector : To add a new selector name with a css selector.
    *
    * Exmaple 1: When I add "mobile logo" selector for "header img#logo" css selector
    * Example 2:  And I add "breadcrumb" selector for ".breadcrumb" css selector
    * Example 3:  And I add "breadcrumb first link" selector for ".breadcrumb li:nth-child(1) a" css selector
    *
    *         You could add in the behat.yml file so that you do not need
    *         to add the most general selectors in your features.
    *          default:
    *            suites:
    *              default:
    *                contexts:
    *                  - SelectorsContext:
    *                     parameters:
    *                       selectors:
    *                         css:
    *                           breadcrumb first link: ".breadcrumb li:nth-child(1) a"
    *                         xpath:
    *                           page title: "//h1[contains(@class, 'page-header')"
    *
    * @When /^I add "(?P<selectorName>[^"]*)" selector for "(?P<cssSelecter>[^"]*)" css selector$/
    */
   public function addSelectorNameForCssSelector($selectorName, $cssSelecter) {

     if (!empty($selectorName) && $selectorName != '' && !empty($cssSelecter) && $cssSelecter != '') {
       // Add the selector name for the css selector to the selectors array.
       $this->cssSelectors[$selectorName] = $cssSelecter;

       // Translate the CSS selector to XPath selector
       $css = new CssSelector();
       $xpathSelector = $css->translateToXPath($cssSelecter);

       // Registor the name for the XPath selector.
       $selectorHandler = $this->getSession()->getSelectorsHandler()->getSelector('named');
       $selectorHandler->registerNamedXpath($selectorName, $xpathSelector);
     }
     else {
      throw new Exception('The selector name and the CSS selector must not be empty.');
     }
   }

   /**
   * #Selector : To add a new selector name with a XPath selector.
   *
   * Exmaple 1: When I add "page title" selector for "//h1[contains(@class, 'page-header')" xpath selector
   * Example 2:  And I add "Dashboard" selector for "//*[@id='navbar-link-admin-dashboard']" xpath selector
   * Example 3:  And I add "Vertical orientation" selector for "//*[@id='navbar-item--2-tray']/div/div[2]/div/button" xpath selector
   *
   *         You could add in the behat.yml file so that you do not need
   *         to add the most general selectors in your features.
   *          default:
   *            suites:
   *              default:
   *                contexts:
   *                  - SelectorsContext:
   *                     parameters:
   *                       selectors:
   *                         css:
   *                           breadcrumb first link: ".breadcrumb li:nth-child(1) a"
   *                         xpath:
   *                           page title: "//h1[contains(@class, 'page-header')"
   *
   * @When /^I add "(?P<selectorName>[^"]*)" selector for "(?P<xpathSelecter>[^"]*)" xpath selector$/
   */
   public function addSelectorNameForXPathSelector($selectorName, $xpathSelecter) {
     if (!empty($selectorName) && $selectorName != '' && !empty($xpathSelecter) && $xpathSelecter != '') {
       // Add the selector name for the XPath selector to the selectors array.
       $this->xpathSelectors[$selectorName] = $xpathSelecter;

       // Registor the name for the XPath selecor.
       $selectorHandler = $this->getSession()->getSelectorsHandler()->getSelector('named');
       $selectorHandler->registerNamedXpath($selectorName, $xpathSelecter);
     }
     else {
      throw new Exception('The selector name and the XPath selector must not be empty.');
     }
   }


  function getElements($element, $selector) {
     try {
         $nodes = $element->find('named', $selector);
     } catch (Exception $e) {
         $nodes = array();
     }
     if (count($nodes) == 0) {
         $nodes = $element->find('css', $selector);
     }
     return $nodes;
  }

  function getPageElements($selector) {
     return $this->getElements($this->getSession()->getPage(), $selector);
  }

}
