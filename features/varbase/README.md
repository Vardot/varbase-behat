  # Varbase Gherkin features
  ------------------------------------------------------------------------------
  A list of features and scenarios to have a full test over Varbase 7.x-3.x

  If you want to run all Gherkin Features over a new Varbase site.
  You will need to create the list of Testing users, and Add French, and Arabic
  languages to the site.

  --------------------------------------------------------------------------
  You can run the following command:
  --------------------------------------------------------------------------
```
  $ bin/behat features/varbase/ --format pretty --out std  --format html  --out reports/report-$( date '+%Y-%m-%d_%H-%M-%S' )
```
  After that you can see the report in the ../behat/reports folder.

  If you want to run the test in steps, if you are not interested in the
  initialization and cleaning up after the test.
```
  $ bin/behat features/varbase/step1-init-tests
  $ bin/behat features/varbase/step2-apply-tests
  $ bin/behat features/varbase/step3-cleanup-tests
```
================================================================================

# List of features in the step 1 init tests:
--------------------------------------------------------------------------------

## Feature: Create default testing users.
* test_authenticated: { email: 'authenticated.test@vardot.com', password: 'dD.123123' }
* test_editor: { email: 'editor.test@vardot.com', password: 'dD.123123' }
* test_content_admin: { email: 'content.admin.test@vardot.com', password: 'dD.123123' }
* test_site_admin: { email: 'site.admin.test@vardot.com', password: 'dD.123123' }
* test_super_admin: { email: 'super.admin.test@vardot.com', password: 'dD.123123' }

Feature: Add Arabic language if we do not have it to languages in the system.
Feature: Add French language if we do not have it to languages in the system.



## List of Features in the step 2 apply tests:
--------------------------------------------------------------------------------
Feature: Website Base Requirements - User Registration - Only admins login.
Feature: Website Base Requirements - User Roles - Simple Roles.
Feature: User Management - Standard User Management - Request new password.
Feature: Website Base Requirements - Website Languages - All content translatable
         to all languages.
Feature: User Management - Standard User Management - Admins can create users
         and assign a role to them.
Feature: Website Base Requirements - Website Languages - English.
Feature: User Management - Standard User Management - Login.
Feature: Content Editing - Rich Text Editor - Convert URLs into links.
Feature: Content Editing - Rich Text Editor - Easy linking to internal content
         by searching for content by its titles.
Feature: Content Editing - Rich Text Editor - Input formats.
Feature: Content Structure Features - Basic Pages - Basic page.
Feature: Content Structure Features - Basic Pages - Pages with pre-defined layouts.
Feature: File & Media Management - Assets Management - Ability to embed existing
         files library in the rich text editor.
Feature: File & Media Management - Assets Management - Files and their usage 
         list page for admins.
Feature: File & Media Management - Transliteration - Transliteration of 
         non-Latin characters on all file types.
Feature: Navigational Features - Breadcrumbs - Standard breadcrumbs.
Feature: Navigational Features - Other menus - Standard menus.
Feature: Page Layouts -  In-Page Layout Manager - Change the layout of a page
         from within predefined templates.
Feature: Page Layouts - In-page layout manager - Drag-and-drop page components 
         to reorder or structure the page.
Feature: Page Layouts - Site Widgets Available In Layouts - Create and re-use
         custom HTML widgets.
Feature: Page Layouts - Site widgets available in layouts - Re-use components
         or blocks across all pages.
Feature: User Management - Standard User Management - Admins can disable users.

## List of features in the step 2 cleanup tests:
--------------------------------------------------------------------------------
Feature: Delete default testing users.
         test_authenticated, test_editor, test_content_admin, test_site_admin,
         test_super_admin

Feature: Delete Arabic language from the system.
Feature: Delete French language from the system.
Feature: Delete testing fieldable pane entities.
Feature: Delete testing files and documents.
