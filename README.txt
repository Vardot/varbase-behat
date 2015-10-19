[1] - If you have a Varbase testing site at this location
/var/www/varbase_behat/varbase-7-x-3-0-alpha1/docroot

[2] - Clone this repo to a behat directory
/var/www/varbase_behat/varbase-7-x-3-0-alpha1/behat

[3] - Edit the file behat.local.yml and change: 

  drupal_root: '/var/www/varbase_behat/varbase-7-x-3-0-alpha1/docroot'
  base_url:  'http://127.0.0.1/varbase_behat/varbase-7-x-3-0-alpha1/docroot'
  drupal_users:
    webmaster:
       'ThePasswored'

[4] - Go to /var/www/varbase_behat/varbase-7-x-3-0-alpha1/behat/

[5] - Run this command to
$ bin/behat

[6] - Run this command with the .feature file to run the Gherkin Script in it to the installed site.
$ bin/behat features/your-gherkin-feature.feature

[7] - Run this command to print all available step definitions
$ bin/behat -di
      - use -dl to just list definition expressions.
      - use -di to show definitions with extended info.
      - use -d 'needle' to find specific definitions.