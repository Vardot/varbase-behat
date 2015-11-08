[1] - If you have a Varbase testing site at this location
/var/www/html/varbase_behat/varbase-7-x-3-0-alpha1/docroot

[2] - Clone this repo to a behat directory
/var/www/html/varbase_behat/varbase-7-x-3-0-alpha1/behat

[3] - Edit the file behat.local.yml and change:

  drupal_root: '/var/www/html/varbase_behat/varbase-7-x-3-0-alpha1/docroot'
  base_url:  'http://localhost/varbase_behat/varbase-7-x-3-0-alpha1/docroot'
  drupal_users:
    webmaster:
       'ThePasswored'

[4] - Go to /var/www/html/varbase_behat/varbase-7-x-3-0-alpha1/behat/

[5] - Run this command.
$ bin/behat

[6] - Run this command with the .feature file to run the Gherkin Script in
      it to the installed site.
$ bin/behat features/your-gherkin-feature.feature

[7] - Run this command to print all available step definitions
$ bin/behat -di
      - use -dl to just list definition expressions.
      - use -di to show definitions with extended info.
      - use -d 'needle' to find specific definitions.

Example :
===============================================================================
$ bin/behat features/website-base-requirements_user-registration_only-admins-login_v1-0.feature
================================================================================
