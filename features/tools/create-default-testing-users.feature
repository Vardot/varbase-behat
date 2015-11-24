Feature: Create default testing users.

  # test_authenticated: { email: 'authenticated.test@vardot.com', password: '123123' }
  # test_editor: { email: 'editor.test@vardot.com', password: '123123' }
  # test_content_admin: { email: 'content.admin.test@vardot.com', password: '123123' }
  # test_site_admin: { email: 'site.admin.test@vardot.com', password: '123123' }
  # test_super_admin: { email: 'super.admin.test@vardot.com', password: '123123' }

Background:
  Given I am a logged in user with the "webmaster" user

  @javascript
  Scenario: Create testing users.
     When I go to "/admin/people/create"
      And I fill in "test_authenticated" for "Username"
      And I fill in "authenticated.test@vardot.com" for "E-mail address"
      And I press "Create new account"
     Then I should see "Created a new user account for test_authenticated. No e-mail has been sent."
     When I go to "/admin/people"
      And I fill in "test_authenticated" for "Username"
      And I press "Apply"
      And I wait for the page
     Then I should see "test_authenticated"
     When I click "test_authenticated"
      And I wait for the page
     Then I should see "History"
     When I click "Edit"
      And I fill in "123123" for "Password"
      And I fill in "123123" for "Confirm password"
     Then I press "Save"

   @javascript
   Scenario: Create testing users.
     When I go to "/admin/people/create"
      And I fill in "test_editor" for "Username"
      And I fill in "editor.test@vardot.com" for "E-mail address"
      And I check the box "Editor"
      And I press "Create new account"
      And I should see "Created a new user account for test_editor. No e-mail has been sent."
      When I go to "/admin/people"
       And I fill in "test_editor" for "Username"
       And I press "Apply"
      And I wait for the page
      Then I should see "test_editor"
      When I click "test_editor"
      Then I should see "History"
      When I click "Edit"
       And I fill in "123123" for "Password"
       And I fill in "123123" for "Confirm password"
      Then I press "Save"

  @javascript
  Scenario: Create testing users.
     When I go to "/admin/people/create"
      And I fill in "test_content_admin" for "Username"
      And I fill in "content.admin.test@vardot.com" for "E-mail address"
      And I check the box "Content Admin"
      And I press "Create new account"
      And I should see "Created a new user account for test_content_admin. No e-mail has been sent."
      When I go to "/admin/people"
       And I fill in "test_content_admin" for "Username"
       And I press "Apply"
       And I wait for the page
      Then I should see "test_content_admin"
      When I click "test_content_admin"
      Then I should see "History"
      When I click "Edit"
       And I fill in "123123" for "Password"
       And I fill in "123123" for "Confirm password"
      Then I press "Save"

  @javascript
  Scenario: Create testing users.
     When I go to "/admin/people/create"
      And I fill in "test_site_admin" for "Username"
      And I fill in "site.admin.test@vardot.com" for "E-mail address"
      And I check the box "Site Admin"
      And I press "Create new account"
      And I should see "Created a new user account for test_site_admin. No e-mail has been sent."
      When I go to "/admin/people"
       And I fill in "test_site_admin" for "Username"
       And I press "Apply"
       And I wait for the page
      Then I should see "test_site_admin"
      When I click "test_site_admin"
      Then I should see "History"
      When I click "Edit"
       And I fill in "123123" for "Password"
       And I fill in "123123" for "Confirm password"
      Then I press "Save"

  @javascript
  Scenario: Create testing users.
     When I go to "/admin/people/create"
      And I fill in "test_super_admin" for "Username"
      And I fill in "super.admin.test@vardot.com" for "E-mail address"
      And I check the box "Super Admin"
      And I press "Create new account"
      And I should see "Created a new user account for test_super_admin. No e-mail has been sent."
      When I go to "/admin/people"
       And I fill in "test_super_admin" for "Username"
       And I press "Apply"
       And I wait for the page
      Then I should see "test_super_admin"
      When I click "test_super_admin"
      Then I should see "History"
      When I click "Edit"
       And I fill in "123123" for "Password"
       And I fill in "123123" for "Confirm password"
      Then I press "Save"
