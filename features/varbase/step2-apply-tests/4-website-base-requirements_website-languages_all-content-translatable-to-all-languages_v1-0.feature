Feature: Website Base Requirements - Website Languages - All content translatable to all languages
  As a logged in user with a permission to translate content
  I want to be able to check if all content types are translatable
  So that I will be able to create a content then I will have the option to translate the content to other languages in the site

# Run the following Gherkin Features to add Arabic and French languages.
# bin/behat features/tools/languages/add-arabic.feature
# bin/behat features/tools/languages/add-french.feature

# Run the following Gherkin Features After you finish work
# So that you can delete Arabic and French languages.
#
# bin/behat features/tools/languages/delete-arabic.feature
# bin/behat features/tools/languages/delete-french.feature

  @javascript @DEV @STG @PROD
  Scenario: Check if the Content Type "Basic page" is translatable.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/page"
     Then the "Enabled, with translation" checkbox should be checked

  @javascript @DEV @STG @PROD
  Scenario: Check if site admin can translate an existing English Basic Page
  to an Arabic version.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/page"
      And I fill in "Test English Basic page" for "Title"
      And I fill in the rich text editor field "Body" with "Test English Basic page body"
      And I select "en" from "Language"
      And I press the "Save" button
     Then I should see "Basic page Test English Basic page has been created."
      And wait
      And I should see "Test English Basic page body"
      And I should see "Translate"
     When I click "Translate"
      And wait
     Then I should see "Translations of Test English Basic page"
      And I should see "Not translated" in the "Arabic" row
     When I click "add translation" in the "Arabic" row
      And wait
     Then I should see "Create Basic page"
     When I fill in "تجربة صفحة بسيطة عربية العنوان" for "Title"
      And I fill in the rich text editor field "Body" with "تجربة صفحة بسيطة عربية المحتوى"
      And I press "Save"
      And I wait
     Then I should see "تجربة صفحة بسيطة عربية العنوان"
     When I click "Translate"
      And wait
     Then I should see "Test English Basic page"
      And I should see "Not translated" in the "French" row
     When I click "add translation" in the "French" row
      And wait
     Then I should see "Create Basic page"
     When I fill in "La page test d'anglais de base" for "Title"
      And I fill in the rich text editor field "Body" with "Corps de la page test d'anglais de base"
      And I press "Save"
      And I wait
     Then I should see "La page test d'anglais de base"
     When I click "Translate"
      And wait
     Then I should see "Test English Basic page"

  @DEV @STG @PROD
  Scenario: Check if the Content Type "Landing page" Translatable, and has
  got Multilingual support selected value of Enabled,
  with translation.
    Given I am a logged in user with the "webmaster" user
     When I go to "/admin/structure/types/manage/landing-page"
     Then the "Enabled, with translation" checkbox should be checked

  @javascript @DEV @STG @PROD
  Scenario: Check if site admins can translate an existing English Basic Page
  to an Arabic version.
    Given I am a logged in user with the "test_site_admin" user
     When I go to "/node/add/landing-page"
      And I fill in "Test English Landing page" for "Title"
      And I select "en" from "Language"
      And I press the "Save" button
     Then I should see "Landing page Test English Landing page has been created."
      And wait
      And I should see "Translate"
     When I click "Translate"
      And wait
     Then I should see "Translations of Test English Landing page"
      And I should see "Not translated" in the "Arabic" row
     When I click "add translation" in the "Arabic" row
      And wait
     Then I should see "Create Landing page"
     When I fill in "اختبار الصفحة القابلة لتغير الترتيب" for "Title"
      And I press "Save"
      And I wait
     Then I should see "اختبار الصفحة القابلة لتغير الترتيب"
     When I click "Translate"
      And wait
     Then I should see "Test English Landing page"
      And I should see "Not translated" in the "French" row
     When I click "add translation" in the "French" row
      And wait
     Then I should see "Create Landing page"
     When I fill in "La page test d'anglais Landing" for "Title"
      And I press "Save"
      And I wait
     Then I should see "La page test d'anglais Landing"
     When I click "Translate"
      And wait
     Then I should see "Test English Landing page"
