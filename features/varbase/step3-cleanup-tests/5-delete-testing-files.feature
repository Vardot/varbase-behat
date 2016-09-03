Feature: Delete testing files and documents.

  Background: 
    Given I am a logged in user with the "webmaster" user
  
  @javascript @tools @local @development @staging
  Scenario: Delete "english_file_with_spaces_and_capital_letters.pdf" testing file.
     When I go to "/admin/content/file"
      And I fill in "english_file_with_spaces_and_capital_letters.pdf" for "Name"
      And I press "Apply"
      And wait
     Then I should see "english_file_with_spaces_and_capital_letters.pdf"
     When I click "english_file_with_spaces_and_capital_letters.pdf"
      And wait
     Then I should see "english_file_with_spaces_and_capital_letters.pdf"
     When I click "Delete"
      And wait
     Then I should see "Are you sure you want to delete the file english_file_with_spaces_and_capital_letters.pdf?"
     When I press "Delete"
      And wait
     Then I should see "Document english_file_with_spaces_and_capital_letters.pdf has been deleted."

  @javascript @tools @local @development @staging
  Scenario: Delete "mlf_rby_m_msft.pdf" testing file.
     When I go to "/admin/content/file"
      And I fill in "mlf_rby_m_msft.pdf" for "Name"
      And I press "Apply"
      And wait
     Then I should see "mlf_rby_m_msft.pdf"
     When I click "mlf_rby_m_msft.pdf"
      And wait
     Then I should see "mlf_rby_m_msft.pdf"
     When I click "Delete"
      And wait
     Then I should see "Are you sure you want to delete the file mlf_rby_m_msft.pdf?"
     When I press "Delete"
      And wait
     Then I should see "Document mlf_rby_m_msft.pdf has been deleted."

  @javascript @tools @local @development @staging
  Scenario: Delete "Embed Flag Earth" testing file.
     When I go to "/admin/content/file"
      And I fill in "Embed Flag Earth" for "Name"
      And I press "Apply"
      And wait
     Then I should see "Embed Flag Earth"
     When I click "Embed Flag Earth"
      And wait
     Then I should see "Embed Flag Earth"
     When I click "Delete"
      And wait
     Then I should see "Are you sure you want to delete the file Embed Flag Earth?"
     When I press "Delete"
      And wait
     Then I should see "Document Embed Flag Earth has been deleted."