Feature: File & Media Management - Transliteration - Transliteration of non-Latin characters on all file types
	As a admin User
	I want have non Latin uploaded files transliterated to Latin character set
	So that files will have a better look in the URL and easier access for all browsers and robots

  @javascript @DEV @STG @PROD
  Scenario: Check if Transliteration options are checked for the transliteration configurations.
	  Given I am a logged in user with the "webmaster" user
     When I go to "admin/config/media/file-system"
     Then I should see "Transliteration"
      And I check "Transliterate file names during upload."
      And I check "Transliterate the displayed file name."
      And I check "Lowercase transliterated file names."

  @javascript @DEV @STG @PROD @DismissAlertsBeforStep @DismissAlertsAfterStep
  Scenario: Check if "English file with spaces and CAPITAL Letters.pdf" will be transliterated.
	  Given I am a logged in user with the "test_site_admin" user
     When I go to "/admin/content/file"
     Then I should see "Add file"
     When I click "Add file"
		  And I wait for AJAX to finish
     Then I should see "Add file"
     When I attach the file "English file with spaces and CAPITAL Letters.pdf" to "Upload a new file"
      And I press the "Next" button
		  And wait
     Then I should see "Document english_file_with_spaces_and_capital_letters.pdf was uploaded."
		 When I go to "admin/content/file"
     Then I should see "Add file"
     When I fill in "english_file_with_spaces_and_capital_letters.pdf" for "Name"
      And I press the "Apply" button
			And I wait for AJAX to finish
     Then I should see "english_file_with_spaces_and_capital_letters.pdf"


  @javascript @DEV @STG @PROD @DismissAlertsBeforStep @DismissAlertsAfterStep
  Scenario: Check if "ملف عربي مع مسافات.pdf" will be transliterated.
	  Given I am a logged in user with the "test_site_admin" user
     When I go to "/admin/content/file"
     Then I should see "Add file"
     When I click "Add file"
      And I wait for AJAX to finish
     Then I should see "Add file"
     When I attach the file "ملف عربي مع مسافات.pdf" to "Upload a new file"
      And I press the "Next" button
		  And wait
     Then I should see "Document mlf_rby_m_msft.pdf was uploaded."
		 When I go to "admin/content/file"
     Then I should see "Add file"
     When I fill in "mlf_rby_m_msft.pdf" for "Name"
      And I press the "Apply" button
			And I wait for AJAX to finish
     Then I should see "mlf_rby_m_msft.pdf"
