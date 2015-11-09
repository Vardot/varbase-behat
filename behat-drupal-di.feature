default | Given I am an anonymous user
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertAnonymousUser()`

default | Given I am not logged in
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertAnonymousUser()`

default | Given I am logged in as a user with the :role role(s)
        | Creates and authenticates a user with the given role(s).
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertAuthenticatedByRole()`

default | Given I am logged in as a/an :role
        | Creates and authenticates a user with the given role(s).
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertAuthenticatedByRole()`

default | Given I am logged in as a user with the :role role(s) and I have the following fields:
        | Creates and authenticates a user with the given role(s) and given fields.
        | | field_user_name     | John  |
        | | field_user_surname  | Smith |
        | | ...                 | ...   |
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertAuthenticatedByRoleWithGivenFields()`

default | Given I am logged in as :name
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertLoggedInByName()`

default | Given I am logged in as a user with the :permissions permission(s)
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertLoggedInWithPermissions()`

default | Then I should see (the text ):text in the ":rowText" row
        | Find text in a table row containing given text.
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertTextInTableRow()`

default | Given I click :link in the :rowText row
        | Attempts to find a link in a table row containing giving text. This is for
        | administrative pages such as the administer content types screen found at
        | `admin/structure/types`.
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertClickInTableRow()`

default | Then I (should )see the :link in the :rowText row
        | Attempts to find a link in a table row containing giving text. This is for
        | administrative pages such as the administer content types screen found at
        | `admin/structure/types`.
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertClickInTableRow()`

default | Given the cache has been cleared
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertCacheClear()`

default | Given I run cron
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertCron()`

default | Given I am viewing a/an :type (content )with the title :title
        | Creates content of the given type.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createNode()`

default | Given a/an :type (content )with the title :title
        | Creates content of the given type.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createNode()`

default | Given I am viewing my :type (content )with the title :title
        | Creates content authored by the current user.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createMyNode()`

default | Given :type content:
        | Creates content of a given type provided in the form:
        | | title    | author     | status | created           |
        | | My title | Joe Editor | 1      | 2014-10-17 8:00am |
        | | ...      | ...        | ...    | ...               |
        | at `Drupal\DrupalExtension\Context\DrupalContext::createNodes()`

default | Given I am viewing a/an :type( content):
        | Creates content of the given type, provided in the form:
        | | title     | My node        |
        | | Field One | My field value |
        | | author    | Joe Editor     |
        | | status    | 1              |
        | | ...       | ...            |
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertViewingNode()`

default | Then I should be able to edit a/an :type( content)
        | Asserts that a given content type is editable.
        | at `Drupal\DrupalExtension\Context\DrupalContext::assertEditNodeOfType()`

default | Given I am viewing a/an :vocabulary term with the name :name
        | Creates a term on an existing vocabulary.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createTerm()`

default | Given a/an :vocabulary term with the name :name
        | Creates a term on an existing vocabulary.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createTerm()`

default | Given users:
        | Creates multiple users.
        | Provide user data in the following format:
        | | name     | mail         | roles        |
        | | user foo | foo@bar.com  | role1, role2 |
        | at `Drupal\DrupalExtension\Context\DrupalContext::createUsers()`

default | Given :vocabulary terms:
        | Creates one or more terms on an existing vocabulary.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createTerms()`

default | Given the/these (following )languages are available:
        | Creates one or more languages.
        |
        | Provide language data in the following format:
        | | langcode |
        | | en       |
        | | fr       |
        |
        |   The table listing languages by their ISO code.
        | at `Drupal\DrupalExtension\Context\DrupalContext::createLanguages()`

default | Then (I )break
        | Pauses the scenario until the user presses a key. Useful when debugging a scenario.
        | at `Drupal\DrupalExtension\Context\DrupalContext::iPutABreakpoint()`

default | Then I should see the error message( containing) :message
        | Checks if the current page contains the given error message
        |
        |   string The text to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertErrorVisible()`

default | Then I should see the following error message(s):
        | Checks if the current page contains the given set of error messages
        |
        |   array An array of texts to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertMultipleErrors()`

default | Given I should not see the error message( containing) :message
        | Checks if the current page does not contain the given error message
        |
        |   string The text to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotErrorVisible()`

default | Then I should not see the following error messages:
        | Checks if the current page does not contain the given set error messages
        |
        |   array An array of texts to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotMultipleErrors()`

default | Then I should see the success message( containing) :message
        | Checks if the current page contains the given success message
        |
        |   string The text to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertSuccessMessage()`

default | Then I should see the following success messages:
        | Checks if the current page contains the given set of success messages
        |
        |   array An array of texts to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertMultipleSuccessMessage()`

default | Given I should not see the success message( containing) :message
        | Checks if the current page does not contain the given set of success message
        |
        |   string The text to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotSuccessMessage()`

default | Then I should not see the following success messages:
        | Checks if the current page does not contain the given set of success messages
        |
        |   array An array of texts to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotMultipleSuccessMessage()`

default | Then I should see the warning message( containing) :message
        | Checks if the current page contains the given warning message
        |
        |   string The text to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertWarningMessage()`

default | Then I should see the following warning messages:
        | Checks if the current page contains the given set of warning messages
        |
        |   array An array of texts to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertMultipleWarningMessage()`

default | Given I should not see the warning message( containing) :message
        | Checks if the current page does not contain the given set of warning message
        |
        |   string The text to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotWarningMessage()`

default | Then I should not see the following warning messages:
        | Checks if the current page does not contain the given set of warning messages
        |
        |   array An array of texts to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotMultipleWarningMessage()`

default | Then I should see the message( containing) :message
        | Checks if the current page contain the given message
        |
        |   string The message to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertMessage()`

default | Then I should not see the message( containing) :message
        | Checks if the current page does not contain the given message
        |
        |   string The message to be checked
        | at `Drupal\DrupalExtension\Context\MessageContext::assertNotMessage()`

default | Given I am at :path
        | Visit a given path, and additionally check for HTTP response code 200.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertAtPath()`

default | When I visit :path
        | Visit a given path, and additionally check for HTTP response code 200.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertAtPath()`

default | When I click :link
        | at `Drupal\DrupalExtension\Context\MinkContext::assertClick()`

default | Given for :field I enter :value
        | at `Drupal\DrupalExtension\Context\MinkContext::assertEnterField()`

default | Given I enter :value for :field
        | at `Drupal\DrupalExtension\Context\MinkContext::assertEnterField()`

default | Given I wait for AJAX to finish
        | Wait for AJAX to finish.
        | at `Drupal\DrupalExtension\Context\MinkContext::iWaitForAjaxToFinish()`

default | When /^(?:|I )press "(?P<button>(?:[^"]|\\")*)"$/
        | Presses button with specified id|name|title|alt|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::pressButton()`

default | When I press the :button button
        | Presses button with specified id|name|title|alt|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::pressButton()`

default | Given I press the :char key in the :field field
        | at `Drupal\DrupalExtension\Context\MinkContext::pressKey()`

default | Then I should see the link :link
        | at `Drupal\DrupalExtension\Context\MinkContext::assertLinkVisible()`

default | Then I should not see the link :link
        | Links are not loaded on the page.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotLinkVisible()`

default | Then I should not visibly see the link :link
        | Links are loaded but not visually visible (e.g they have display: hidden applied).
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotLinkVisuallyVisible()`

default | Then I (should )see the heading :heading
        | at `Drupal\DrupalExtension\Context\MinkContext::assertHeading()`

default | Then I (should )not see the heading :heading
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotHeading()`

default | Then I (should ) see the button :button
        | at `Drupal\DrupalExtension\Context\MinkContext::assertButton()`

default | Then I (should ) see the :button button
        | at `Drupal\DrupalExtension\Context\MinkContext::assertButton()`

default | When I follow/click :link in the :region( region)
        |   If region or link within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertRegionLinkFollow()`

default | Given I press :button in the :region( region)
        | Checks, if a button with id|name|title|alt|value exists or not and pressess the same
        |
        |
        |   string The id|name|title|alt|value of the button to be pressed
        |
        |   string The region in which the button should be pressed
        |
        |   If region or button within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertRegionPressButton()`

default | Given I fill in :value for :field in the :region( region)
        | Fills in a form field with id|name|title|alt|value in the specified region.
        |
        |
        |
        |   If region cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::regionFillField()`

default | Given I fill in :field with :value in the :region( region)
        | Fills in a form field with id|name|title|alt|value in the specified region.
        |
        |
        |
        |   If region cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::regionFillField()`

default | Then I should see the heading :heading in the :region( region)
        | Find a heading in a specific region.
        |
        |
        |
        |   If region or header within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertRegionHeading()`

default | Then I should see the :heading heading in the :region( region)
        | Find a heading in a specific region.
        |
        |
        |
        |   If region or header within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertRegionHeading()`

default | Then I should see the link :link in the :region( region)
        |   If region or link within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertLinkRegion()`

default | Then I should not see the link :link in the :region( region)
        |   If region or link within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotLinkRegion()`

default | Then I should see( the text) :text in the :region( region)
        |   If region or text within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertRegionText()`

default | Then I should not see( the text) :text in the :region( region)
        |   If region or text within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotRegionText()`

default | Then I (should )see the text :text
        | at `Drupal\DrupalExtension\Context\MinkContext::assertTextVisible()`

default | Then I should not see the text :text
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotTextVisible()`

default | Then I should get a :code HTTP response
        | at `Drupal\DrupalExtension\Context\MinkContext::assertHttpResponse()`

default | Then I should not get a :code HTTP response
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNotHttpResponse()`

default | Given I check the box :checkbox
        | at `Drupal\DrupalExtension\Context\MinkContext::assertCheckBox()`

default | Given I uncheck the box :checkbox
        | at `Drupal\DrupalExtension\Context\MinkContext::assertUncheckBox()`

default | When I select the radio button :label with the id :id
        | at `Drupal\DrupalExtension\Context\MinkContext::assertSelectRadioById()`

default | When I select the radio button :label
        | at `Drupal\DrupalExtension\Context\MinkContext::assertSelectRadioById()`

default | Given /^(?:|I )am on (?:|the )homepage$/
        | Opens homepage.
        | at `Drupal\DrupalExtension\Context\MinkContext::iAmOnHomepage()`

default | When /^(?:|I )go to (?:|the )homepage$/
        | Opens homepage.
        | at `Drupal\DrupalExtension\Context\MinkContext::iAmOnHomepage()`

default | Given /^(?:|I )am on "(?P<page>[^"]+)"$/
        | Opens specified page.
        | at `Drupal\DrupalExtension\Context\MinkContext::visit()`

default | When /^(?:|I )go to "(?P<page>[^"]+)"$/
        | Opens specified page.
        | at `Drupal\DrupalExtension\Context\MinkContext::visit()`

default | When /^(?:|I )reload the page$/
        | Reloads current page.
        | at `Drupal\DrupalExtension\Context\MinkContext::reload()`

default | When /^(?:|I )move backward one page$/
        | Moves backward one page in history.
        | at `Drupal\DrupalExtension\Context\MinkContext::back()`

default | When /^(?:|I )move forward one page$/
        | Moves forward one page in history
        | at `Drupal\DrupalExtension\Context\MinkContext::forward()`

default | When /^(?:|I )follow "(?P<link>(?:[^"]|\\")*)"$/
        | Clicks link with specified id|title|alt|text.
        | at `Drupal\DrupalExtension\Context\MinkContext::clickLink()`

default | When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with "(?P<value>(?:[^"]|\\")*)"$/
        | Fills in form field with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::fillField()`

default | When /^(?:|I )fill in "(?P<field>(?:[^"]|\\")*)" with:$/
        | Fills in form field with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::fillField()`

default | When /^(?:|I )fill in "(?P<value>(?:[^"]|\\")*)" for "(?P<field>(?:[^"]|\\")*)"$/
        | Fills in form field with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::fillField()`

default | When /^(?:|I )fill in the following:$/
        | Fills in form fields with provided table.
        | at `Drupal\DrupalExtension\Context\MinkContext::fillFields()`

default | When /^(?:|I )select "(?P<option>(?:[^"]|\\")*)" from "(?P<select>(?:[^"]|\\")*)"$/
        | Selects option in select field with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::selectOption()`

default | When /^(?:|I )additionally select "(?P<option>(?:[^"]|\\")*)" from "(?P<select>(?:[^"]|\\")*)"$/
        | Selects additional option in select field with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::additionallySelectOption()`

default | When /^(?:|I )check "(?P<option>(?:[^"]|\\")*)"$/
        | Checks checkbox with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::checkOption()`

default | When /^(?:|I )uncheck "(?P<option>(?:[^"]|\\")*)"$/
        | Unchecks checkbox with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::uncheckOption()`

default | When /^(?:|I )attach the file "(?P<path>[^"]*)" to "(?P<field>(?:[^"]|\\")*)"$/
        | Attaches file to field with specified id|name|label|value.
        | at `Drupal\DrupalExtension\Context\MinkContext::attachFileToField()`

default | Then /^(?:|I )should be on "(?P<page>[^"]+)"$/
        | Checks, that current page PATH is equal to specified.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertPageAddress()`

default | Then /^(?:|I )should be on (?:|the )homepage$/
        | Checks, that current page is the homepage.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertHomepage()`

default | Then /^the (?i)url(?-i) should match (?P<pattern>"(?:[^"]|\\")*")$/
        | Checks, that current page PATH matches regular expression.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertUrlRegExp()`

default | Then /^the response status code should be (?P<code>\d+)$/
        | Checks, that current page response status is equal to specified.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertResponseStatus()`

default | Then /^the response status code should not be (?P<code>\d+)$/
        | Checks, that current page response status is not equal to specified.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertResponseStatusIsNot()`

default | Then /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)"$/
        | Checks, that page contains specified text.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertPageContainsText()`

default | Then /^(?:|I )should not see "(?P<text>(?:[^"]|\\")*)"$/
        | Checks, that page doesn't contain specified text.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertPageNotContainsText()`

default | Then /^(?:|I )should see text matching (?P<pattern>"(?:[^"]|\\")*")$/
        | Checks, that page contains text matching specified pattern.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertPageMatchesText()`

default | Then /^(?:|I )should not see text matching (?P<pattern>"(?:[^"]|\\")*")$/
        | Checks, that page doesn't contain text matching specified pattern.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertPageNotMatchesText()`

default | Then /^the response should contain "(?P<text>(?:[^"]|\\")*)"$/
        | Checks, that HTML response contains specified string.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertResponseContains()`

default | Then /^the response should not contain "(?P<text>(?:[^"]|\\")*)"$/
        | Checks, that HTML response doesn't contain specified string.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertResponseNotContains()`

default | Then /^(?:|I )should see "(?P<text>(?:[^"]|\\")*)" in the "(?P<element>[^"]*)" element$/
        | Checks, that element with specified CSS contains specified text.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertElementContainsText()`

default | Then /^(?:|I )should not see "(?P<text>(?:[^"]|\\")*)" in the "(?P<element>[^"]*)" element$/
        | Checks, that element with specified CSS doesn't contain specified text.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertElementNotContainsText()`

default | Then /^the "(?P<element>[^"]*)" element should contain "(?P<value>(?:[^"]|\\")*)"$/
        | Checks, that element with specified CSS contains specified HTML.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertElementContains()`

default | Then /^the "(?P<element>[^"]*)" element should not contain "(?P<value>(?:[^"]|\\")*)"$/
        | Checks, that element with specified CSS doesn't contain specified HTML.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertElementNotContains()`

default | Then /^(?:|I )should see an? "(?P<element>[^"]*)" element$/
        | Checks, that element with specified CSS exists on page.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertElementOnPage()`

default | Then /^(?:|I )should not see an? "(?P<element>[^"]*)" element$/
        | Checks, that element with specified CSS doesn't exist on page.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertElementNotOnPage()`

default | Then /^the "(?P<field>(?:[^"]|\\")*)" field should contain "(?P<value>(?:[^"]|\\")*)"$/
        | Checks, that form field with specified id|name|label|value has specified value.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertFieldContains()`

default | Then /^the "(?P<field>(?:[^"]|\\")*)" field should not contain "(?P<value>(?:[^"]|\\")*)"$/
        | Checks, that form field with specified id|name|label|value doesn't have specified value.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertFieldNotContains()`

default | Then /^the "(?P<checkbox>(?:[^"]|\\")*)" checkbox should be checked$/
        | Checks, that checkbox with specified in|name|label|value is checked.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertCheckboxChecked()`

default | Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" (?:is|should be) checked$/
        | Checks, that checkbox with specified in|name|label|value is checked.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertCheckboxChecked()`

default | Then /^the "(?P<checkbox>(?:[^"]|\\")*)" checkbox should not be checked$/
        | Checks, that checkbox with specified in|name|label|value is unchecked.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertCheckboxNotChecked()`

default | Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" should (?:be unchecked|not be checked)$/
        | Checks, that checkbox with specified in|name|label|value is unchecked.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertCheckboxNotChecked()`

default | Then /^the checkbox "(?P<checkbox>(?:[^"]|\\")*)" is (?:unchecked|not checked)$/
        | Checks, that checkbox with specified in|name|label|value is unchecked.
        | at `Drupal\DrupalExtension\Context\MinkContext::assertCheckboxNotChecked()`

default | Then /^(?:|I )should see (?P<num>\d+) "(?P<element>[^"]*)" elements?$/
        | Checks, that (?P<num>\d+) CSS elements exist on the page
        | at `Drupal\DrupalExtension\Context\MinkContext::assertNumElements()`

default | Then /^print current URL$/
        | Prints current URL to console.
        | at `Drupal\DrupalExtension\Context\MinkContext::printCurrentUrl()`

default | Then /^print last response$/
        | Prints last response to console.
        | at `Drupal\DrupalExtension\Context\MinkContext::printLastResponse()`

default | Then /^show last response$/
        | Opens last response content in browser.
        | at `Drupal\DrupalExtension\Context\MinkContext::showLastResponse()`

default | Then I should see the button :button in the :region( region)
        | Checks if a button with id|name|title|alt|value exists in a region
        |
        |
        |
        |   string The id|name|title|alt|value of the button
        |
        |   string The region in which the button should be found
        |
        |   If region or button within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertRegionButton()`

default | Then I should see the :button button in the :region( region)
        | Checks if a button with id|name|title|alt|value exists in a region
        |
        |
        |
        |   string The id|name|title|alt|value of the button
        |
        |   string The region in which the button should be found
        |
        |   If region or button within it cannot be found.
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertRegionButton()`

default | Then I( should) see the :tag element in the :region( region)
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertRegionElement()`

default | Then I( should) not see the :tag element in the :region( region)
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertNotRegionElement()`

default | Then I( should) not see :text in the :tag element in the :region( region)
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertNotRegionElementText()`

default | Then I( should) see the :tag element with the :attribute attribute set to :value in the :region( region)
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertRegionElementAttribute()`

default | Then I( should) see :text in the :tag element with the :attribute attribute set to :value in the :region( region)
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertRegionElementTextAttribute()`

default | Then I( should) see :text in the :tag element with the :property CSS property set to :value in the :region( region)
        | at `Drupal\DrupalExtension\Context\MarkupContext::assertRegionElementTextCss()`
