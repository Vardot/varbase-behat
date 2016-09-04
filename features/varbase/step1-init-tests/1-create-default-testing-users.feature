Feature: Create default testing users.

# test_authenticated: { email: 'authenticated.test@vardot.com', password: 'dD.123123' }
# test_editor: { email: 'editor.test@vardot.com', password: 'dD.123123' }
# test_content_admin: { email: 'content.admin.test@vardot.com', password: 'dD.123123' }
# test_site_admin: { email: 'site.admin.test@vardot.com', password: 'dD.123123' }
# test_super_admin: { email: 'super.admin.test@vardot.com', password: 'dD.123123' }

  Background: 
    Given I am a logged in user with the "webmaster" user
  
  @javascript @tools @local @development @staging
  Scenario: Create the test_authenticated user.
     When I go to "/admin/people/create"
      And I wait
      And I fill in "test_authenticated" for "Username"
      And I fill in "authenticated.test@vardot.com" for "E-mail address"
      And I press "Create new account"
      And wait max of 10s
     Then I should not see "The name test_authenticated is already taken."
     When I go to "/admin/people"
      And I fill in "test_authenticated" for "Username"
      And I press "Apply"
      And wait max of 10s
     Then I should see "test_authenticated"
     When I click "test_authenticated"
      And wait max of 10s
     Then I should see "History"
     When I click "Edit"
      And wait max of 10s
      And I fill in "dD.123123" for "Password"
      And I fill in "dD.123123" for "Confirm password"
     Then I press "Save"
  
  @javascript @tools @local @development @staging
  Scenario: Create the test_editor user.
     When I go to "/admin/people/create"
      And I wait
      And I fill in "test_editor" for "Username"
      And I fill in "editor.test@vardot.com" for "E-mail address"
      And I check the box "Editor"
      And I press "Create new account"
      And wait max of 10s
     Then I should not see "The name test_editor is already taken."
     When I go to "/admin/people"
      And I fill in "test_editor" for "Username"
      And I press "Apply"
      And wait max of 10s
     Then I should see "test_editor"
     When I click "test_editor"
     Then I should see "History"
     When I click "Edit"
      And wait max of 10s
      And I fill in "dD.123123" for "Password"
      And I fill in "dD.123123" for "Confirm password"
     Then I press "Save"
  
  @javascript @tools @local @development @staging
  Scenario: Create the test_content_admin user.
     When I go to "/admin/people/create"
      And I wait
      And I fill in "test_content_admin" for "Username"
      And I fill in "content.admin.test@vardot.com" for "E-mail address"
      And I check the box "Content Admin"
      And I press "Create new account"
      And wait max of 10s
     Then I should not see "The name test_content_admin is already taken."
     When I go to "/admin/people"
      And I fill in "test_content_admin" for "Username"
      And I press "Apply"
      And wait max of 10s
     Then I should see "test_content_admin"
     When I click "test_content_admin"
     Then I should see "History"
     When I click "Edit"
      And wait max of 10s
      And I fill in "dD.123123" for "Password"
      And I fill in "dD.123123" for "Confirm password"
     Then I press "Save"
  
  @javascript @tools @local @development @staging
  Scenario: Create the test_site_admin user.
     When I go to "/admin/people/create"
      And I wait
      And I fill in "test_site_admin" for "Username"
      And I fill in "site.admin.test@vardot.com" for "E-mail address"
      And I check the box "Site Admin"
      And I press "Create new account"
      And wait max of 10s
     Then I should not see "The name test_site_admin is already taken."
     When I go to "/admin/people"
      And I fill in "test_site_admin" for "Username"
      And I press "Apply"
      And wait max of 10s
     Then I should see "test_site_admin"
     When I click "test_site_admin"
      And wait max of 10s
     Then I should see "History"
     When I click "Edit"
      And wait max of 10s
      And I fill in "dD.123123" for "Password"
      And I fill in "dD.123123" for "Confirm password"
     Then I press "Save"
  
  @javascript @tools @local @development @staging
  Scenario: Create the test_super_admin user.
     When I go to "/admin/people/create"
      And I wait
      And I fill in "test_super_admin" for "Username"
      And I fill in "super.admin.test@vardot.com" for "E-mail address"
      And I check the box "Super Admin"
      And I press "Create new account"
      And wait max of 10s
     Then I should not see "The name test_super_admin is already taken."
     When I go to "/admin/people"
      And I fill in "test_super_admin" for "Username"
      And I press "Apply"
      And wait max of 10s
     Then I should see "test_super_admin"
     When I click "test_super_admin"
     Then I should see "History"
     When I click "Edit"
      And wait max of 10s
      And I fill in "dD.123123" for "Password"
      And I fill in "dD.123123" for "Confirm password"
     Then I press "Save"

