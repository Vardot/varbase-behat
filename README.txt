


curl http://getcomposer.org/installer | php

php composer.phar install


Edit the file behat.local.yml and change the base_url from http://varbase.local
to the testing domain.


Run this command to
$ bin/behat


$ bin/behat features/you-gherkin-feature.feature
