Feature: Installation - Varbase - Default installation to initiate a site for a client
  As an Application site Builder
  I want to be able to install Varbase for a selected client
  So that I will be able to initiate the site with the default installation

 @javascript @install @DEV
 Scenario: Installation or Varbase
  Given I go to "/install.php"
   Then I should see "Select an installation profile"
   When I select the "Vardot Base" radio button
    And I press "Save and continue"
    And wait
   Then I should see "Choose language"
   When I press "Save and continue"
    And wait
   Then I should see "Database configuration"
   When I press "Save and continue"
    And I wait for the batch job to finish
    And I wait for the batch job to finish
    And I wait for the batch job to finish
   Then I should see "Configure site"
    And wait
   When I fill in "Site name" with "Varbase"
    And I fill in "Site e-mail address" with "vardot.com"
    And I fill in "Username" with "webmaster"
    And I fill in "E-mail address" with "webmaster@vardot.com"
    And I fill in "Password" with "dD.123123"
    And I fill in "Confirm password" with "dD.123123"
    And I uncheck the box "Check for updates automatically"
    And I press "Save and continue"
    And I wait for the batch job to finish
