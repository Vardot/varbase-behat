[1] - If you have a Varbase testing site at this location
/var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/docroot

[2] - Clone this repo to a behat directory
/var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/behat

[3] - Edit the file behat.varbase.yml and change:

  base_url:  'http://localhost/varbase_behat/varbase-7-x-3-0-alpha2/docroot'


[4] - Go to /var/www/html/varbase_behat/varbase-7-x-3-0-alpha2/behat/

[5] - Run this command.
$ bin/behat

[6] - Run this command with the .feature file to run the Gherkin Script in
      it to the installed site.
$ bin/behat features/varbase/your-gherkin-feature.feature
$ bin/behat features/project-name/your-gherkin-feature.feature

[7] - Run this command to print all available step definitions
$ bin/behat -di
      - use -dl to just list definition expressions.
      - use -di to show definitions with extended info.
      - use -d 'needle' to find specific definitions.

[8] - Run the selenium2 at the port you want .. for Example port 4445
$ java -jar selenium-server-standalone-2.48.2.jar -port 4445

Example :
================================================================================
$ bin/behat features/varbase/website-base-requirements_user-registration_only-admins-login_v1-0.feature
Feature: Website Base Requirements - User Registration - Only admins login
  As an anonymous user
  I will not be able to register as a user in the website
  So that I will need a site admin or super admin to add me to the website

  Background:                    # features/website-base-requirements_user-registration_only-admins-login_v1-0.feature:5
    Given I am an anonymous user # Drupal\DrupalExtension\Context\DrupalContext::assertAnonymousUser()

  Scenario: Check if a not logged in user can create an account # features/website-base-requirements_user-registration_only-admins-login_v1-0.feature:8
    When I go to "/user"                                        # Drupal\DrupalExtension\Context\MinkContext::visit()
    Then I should not see "Create new account"                  # Drupal\DrupalExtension\Context\MinkContext::assertPageNotContainsText()

  Scenario: Check if a not logged in user can register an account # features/website-base-requirements_user-registration_only-admins-login_v1-0.feature:12
    When I go to "/user/register"                                 # Drupal\DrupalExtension\Context\MinkContext::visit()
    Then I should see "Access denied"                             # Drupal\DrupalExtension\Context\MinkContext::assertPageContainsText()

  Scenario: Check if a not logged in user can access administration pages # features/website-base-requirements_user-registration_only-admins-login_v1-0.feature:16
    When I go to "/admin"                                                 # Drupal\DrupalExtension\Context\MinkContext::visit()
    Then I should see "Access denied"                                     # Drupal\DrupalExtension\Context\MinkContext::assertPageContainsText()

3 scenarios (3 passed)
9 steps (9 passed)
0m0.55s (15.68Mb)
================================================================================
