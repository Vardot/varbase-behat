@api
Feature: Disable ds_ui module.

  Scenario: Disable ds_ui module.
    Given I run drush "dis" "ds_ui -y"
     Then print last drush output
