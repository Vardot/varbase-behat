@d7 @api
Feature: Content Management
  When I log into the website
  As an administrator
  I should be able to create, edit, and delete page content

  Scenario: Create nodes with specific authorship
    Given users:
    | name                    | mail                               | status |
    | editor_test             | editor_test@vardot.com             | 1      |
    | authenticated_user_test | authenticated_user_test@vardot.com | 1      |
    | content_admin_test      | content_admin_test@vardot.com      | 1      |
    | site_admin_test         | site_admin_test@vardot.com         | 1      |
    | super_admin_test        | super_admin_test@vardot.com        | 1      |

    And "page" content:
    | title          | author      | body             |
    | Article by editor_test | editor_test | PLACEHOLDER BODY |
    When I am logged in as a user with the "super_admin" role
    And I am on the homepage
    And I follow "Article by editor_test"
    Then I should see the link "editor_test"
