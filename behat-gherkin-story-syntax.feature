[Feature|Business Need|Ability]: Internal operations
  In order to stay secret
  As a secret organization
  We need to be able to erase past agents' memory

  Background:
    Given there is agent A
    And there is agent B

  Scenario: Erasing agent memory
    Given there is agent J
    And there is agent K
    When I erase agent K's memory
    Then there should be agent J
    But there should not be agent K

  [Scenario Outline|Scenario Template]: Erasing other agents' memory
    Given there is agent <agent1>
    And there is agent <agent2>
    When I erase agent <agent2>'s memory
    Then there should be agent <agent1>
    But there should not be agent <agent2>

    [Examples|Scenarios]:
      | agent1 | agent2 |
      | D      | M      |

