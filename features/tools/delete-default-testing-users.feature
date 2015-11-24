Feature: Delete default testing users.

  # test_authenticated: { email: 'authenticated.test@vardot.com', password: '123123' }
  # test_editor: { email: 'editor.test@vardot.com', password: '123123' }
  # test_content_admin: { email: 'content.admin.test@vardot.com', password: '123123' }
  # test_site_admin: { email: 'site.admin.test@vardot.com', password: '123123' }
  # test_super_admin: { email: 'super.admin.test@vardot.com', password: '123123' }

Background:
  Given I am a logged in user with the "webmaster" user

  @javascript
  Scenario: Create testing users.
      When I go to "/admin/people"
       And I fill in "test_authenticated" for "Username"
       And I press "Apply"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_authenticated"
      When I click "test_authenticated"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "History"
      When I click "Edit"
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "Are you sure you want to cancel the account test_authenticated?"
      When I select the radio button "Delete the account and its content."
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_authenticated has been deleted."

    @javascript
    Scenario: Create testing users
      When I go to "/admin/people"
       And I fill in "test_editor" for "Username"
       And I press "Apply"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_editor"
      When I click "test_editor"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "History"
      When I click "Edit"
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "Are you sure you want to cancel the account test_editor?"
      When I select the radio button "Delete the account and its content."
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_editor has been deleted."

    @javascript
    Scenario: Create testing users
      When I go to "/admin/people"
       And I fill in "test_content_admin" for "Username"
       And I press "Apply"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_content_admin"
      When I click "test_content_admin"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "History"
      When I click "Edit"
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "Are you sure you want to cancel the account test_content_admin?"
      When I select the radio button "Delete the account and its content."
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_content_admin has been deleted."

    @javascript
    Scenario: Create testing users
      When I go to "/admin/people"
       And I fill in "test_site_admin" for "Username"
       And I press "Apply"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_site_admin"
      When I click "test_site_admin"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "History"
      When I click "Edit"
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "Are you sure you want to cancel the account test_site_admin?"
      When I select the radio button "Delete the account and its content."
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_site_admin has been deleted."

    @javascript
    Scenario: Create testing users
      When I go to "/admin/people"
       And I fill in "test_super_admin" for "Username"
       And I press "Apply"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_super_admin"
      When I click "test_super_admin"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "History"
      When I click "Edit"
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "Are you sure you want to cancel the account test_super_admin?"
      When I select the radio button "Delete the account and its content."
       And I press "Cancel account"
       And I wait max of "5" seconds for the page to be ready and loaded
      Then I should see "test_super_admin has been deleted."
