Feature: Disable ds_ui module.

  @api @local @development
  Scenario: Disable ds_ui module.
    Given I run drush "dis" "ds_ui -y"
     Then print last drush output
  
