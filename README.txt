# Varbase Behat #

  Varbase Behat is a set of Gherkin Features and custom Varbase Context with
 Custom step definitions, and assets, which help with the automatic testing
 for varbase websites.


   This page can help  you to have all steps, which you need to run the
 Behat Gherkin Features to test a varbase website in your localhost machine.


 Predefined request, you will need to have a running Varbase website:
   - Apache/http/https server.
   - PHP server, and have the mod_rewrite enabled.
   - MySQL server.
   - Configure your PHP/MySQL to work well with Varbase, Have a look at
     https://bitbucket.org/snippets/Vardot/8rGL/dev-tools-installs snippets.
   - Download Varbase from https://www.drupal.org/project/varbase Drupal website.
   - Install Varbase by following the  Installing Varbase 7.x-3.x
     https://www.drupal.org/node/2570843 documentation page.
   - Download Varbase Behat:
     https://github.com/Vardot/varbase-behat/releases

 After that you can go through the following steps.

--------------------------------------------------------------------------------
1. If you have a Varbase testing site at this location
/var/www/html/testing/docroot

--------------------------------------------------------------------------------
2. Download the latest Behat package from https://github.com/Vardot/varbase-behat
   repository, and place it in the folder as below.
/var/www/html/testing/behat

--------------------------------------------------------------------------------
3. Change the base url value in behat.varbase.yml file, to the domain or the
   local virtual domain.

  base_url:  'http://localhost/testing/docroot'

--------------------------------------------------------------------------------
4. Go to ../behat/ Then run the
  following commands to install all required packages, Libraries from vendors.

$ curl -sS https://getcomposer.org/installer | php
$ php composer.phar install

--------------------------------------------------------------------------------
5. Open a new terminal window then start selenium2 at the port 4445. You can
   change the worker selenium robot server and the port number by changing the parameter.

    "wd_host: 127.0.0.1:4445/wd/hub"

  in the behat.varbase.yml file.
  or you can get the selenium stand alone server from
  http://www.seleniumhq.org/download/ 
  then you could run this command in the same location in the terminal

$ java -jar selenium-*.jar -port 4445

You can Install and configure selenium server to run on the selenium worker
server  by using our command.

$ sh ./tools/install-selenium-server/install-selenium-server-2.53.1.sh

--------------------------------------------------------------------------------
6. Run the behat command at ../behat/

$ bin/behat features/varbase/step2-apply-tests/01-website-base-requirements_user-registration_only-admins-login_v1-0.feature

================================================================================
Feature: Website Base Requirements - User Registration - Only admins login
  As an anonymous user
  I will not be able to register as a user in the website
  So that I will need a site admin or super admin to add me to the website

  Background: 
    Given I am an anonymous user

  Scenario: Check if a not logged in user can create an account
    When I go to "/user"
    Then I should not see "Create new account"

  Scenario: Check if a not logged in user can register an account
    When I go to "/user/register"
    Then I should see "Access denied"

  Scenario: Check if a not logged in user can access administration pages
    When I go to "/admin"
    Then I should see "Access denied"

3 scenarios (3 passed)
9 steps (9 passed)
0m2.21s (59.89Mb)
================================================================================

--------------------------------------------------------------------------------
7. Run this command with the .feature file to run the Gherkin Script in it to the installed site.

$ bin/behat features/varbase/your-gherkin-feature.feature
$ bin/behat features/project-name/your-gherkin-feature.feature

--------------------------------------------------------------------------------
8. Run this command to print all available step definitions

$ bin/behat -di

    - use -dl to just list definition expressions.
    - use -di to show definitions with extended info.
    - use -d 'needle' to find specific definitions.

 All Varbase custom step definitions are tagged with #varbase tag.

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

 Scenarios are tagged with the Behat tags of:
   @DEV = Development 
   @STG = Staging
   @PROD = Production

   So that we only run bin/behat --tags with the right tag for the environment.

   Example:
================================================================================
    
    $ bin/behat --tags '@DEV' features/varbase/

    Which it will run Scenarios which has got the @DEV tag.

================================================================================

    $ bin/behat --tags '@STG' features/varbase/

    Which it will run Scenarios which has got the @STG tag.

================================================================================

    $ bin/behat --tags '@PROD' features/varbase/

    Which it will run Scenarios which has got the @PROD tag.

================================================================================

9. To see the report in HTML. Go and open this file in a browser.
    ../behat/reports/index.html
    You will see the latest report for latest run.

    if you want to custom a report you can add
    --format pretty --out std
    --format html  --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )

    to format and select your output.

    Example:

    $ bin/behat features/example.feature --format pretty --out std --format html --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )

10. If you want to run all Gherkin Features over a new Varbase site.
    You will need to create the list of Testing users, and Add French, and Arabic
    languages to the site.

    # --------------------------------------------------------------------------
    # You can run the following command:
    # --------------------------------------------------------------------------
    $ bin/behat features/varbase/ --format pretty --out std  --format html  --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )

    After that you can see the report in the ../behat/reports folder.

    If you want to run the test in steps, if you are not interested in the
    initialization and cleaning up after the test.

    $ bin/behat features/varbase/step1-init-tests
    $ bin/behat features/varbase/step2-apply-tests
    $ bin/behat features/varbase/step3-cleanup-tests


11. If you want to test the installation process feature, you will need to use the varbase
    Install config file, as you can see in the following command.

    $ bin/behat --config=behat.varbase-install.yml tools/install-varbase/installation_varbase_default-installation-to-initiate-a-site-for-a-client.feature
