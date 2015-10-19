


curl http://getcomposer.org/installer | php

php composer.phar install


Edit the file behat.local.yml and change the base_url from http://varbase.local
to the testing domain.


Run this command to
$ bin/behat

Run this command with the .feature file to run the Gherkin Script in it to the installed site.
$ bin/behat features/your-gherkin-feature.feature

Run this command to print all available step definitions
$ bin/behat -di
      - use -dl to just list definition expressions.
      - use -di to show definitions with extended info.
      - use -d 'needle' to find specific definitions.



