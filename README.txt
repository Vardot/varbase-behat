[1] - If you have a Varbase testing site at this location
/var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/docroot

[2] - Download the latest behat package from "Downloads" section in
      the Bitbucket repo, and place it in the folder as below
/var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/behat

[3] - Edit the file behat.varbase.yml and change:

  base_url:  'http://localhost/varbase_behat/varbase-7-x-3-0-alpha2/docroot'

[4] Go to /var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/behat/
    Then run the following commands to install all required packages,
    Libraries from vendors.

$ curl -sS https://getcomposer.org/installer | php
$ php composer.phar install

[5] Initializes behat.
$ bin/behat --init

[6] Open a new terminal window then start selenium2 at the port 4445.
    You can change the port number by changing the parameter
    "wd_host: 127.0.0.1:4445/wd/hub" in the behat.varbase.yml file.

$ java6-jar selenium-server-standalone-2.48.2.jar -port 4445

[7] Run the behat command at /var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/behat/

$ bin/behat features/example.feature

[8] Run this command.
$ bin/behat features/google/google-search.feature

[9] Run this command with the .feature file to run the Gherkin Script in
      it to the installed site.
$ bin/behat features/varbase/your-gherkin-feature.feature
$ bin/behat features/project-name/your-gherkin-feature.feature

[10] Run this command to print all available step definitions
$ bin/behat -di
    - use -dl to just list definition expressions.
    - use -di to show definitions with extended info.
    - use -d 'needle' to find specific definitions.

[11] All Varbase custom step definitions are tagged with #varbase tag.

  Example : after a run for  bin/behat -di command.
================================================================================
  default | Then /^I should see image with the "([^"]*)" title text$/
          | #varbase : To Find an image with the title text attribute.
          | Example 1: Then I should see image with the "Flag Earth" title text
          | at `VarbaseContext::iShouldSeeImageWithTheTitleText()`

  default | Then /^I should see image with the "([^"]*)" alt text$/
          | #varbase : To Find an image with the alt text attribute.
          | Example 1: Then I should see image with the "Flag Earth" alt text
          | at `VarbaseContext::iShouldSeeImageWithTheAltText()`
================================================================================

Example :
================================================================================
bin/behat features/example.feature
Feature: Example

 Scenario: Go to about page with no visaul view.  # features/example.feature:3
   Given I go to "https://www.vardot.com" website # VarbaseContext::iGoToWebsite()
   When I click "About"                           # Drupal\DrupalExtension\Context\MinkContext::assertClick()
   Then I should see "the team"                   # Drupal\DrupalExtension\Context\MinkContext::assertPageContainsText()

 @mink:selenium2
 Scenario: Go to about page using mink selenium2  # features/example.feature:9
   Given I go to "https://www.vardot.com" website # VarbaseContext::iGoToWebsite()
   When I click "About"                           # Drupal\DrupalExtension\Context\MinkContext::assertClick()
   Then I should see "the team"                   # Drupal\DrupalExtension\Context\MinkContext::assertPageContainsText()

 @javascript
 Scenario: To search in Google about Varbase.     # features/example.feature:15
   Given I go to "https://www.vardot.com" website # VarbaseContext::iGoToWebsite()
   When I click "About"                           # Drupal\DrupalExtension\Context\MinkContext::assertClick()
   Then I should see "the team"                   # Drupal\DrupalExtension\Context\MinkContext::assertPageContainsText()

3 scenarios (3 passed)
9 steps (9 passed)
0m51.12s (47.83Mb)
================================================================================
