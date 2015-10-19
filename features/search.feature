Feature: Search
  Search is the most important part of a site!

@search
  Scenario: Search with no test content produces no results
    Given I am on "search/node"
      And the response status code should be 200
      And I fill in "keys" with "node"
     When I press "edit-submit"
     Then I should see "Your search yielded no results"

@search
  Scenario: Search with test content produces result
    Given a node of type "page" with the title "My first node" exists
      And cron has run
      And I am on "search/node"
      And the response status code should be 200
      And I fill in "keys" with "node"
     When I press "edit-submit"
      Then I should not see "Your search yielded no results"
      And I should see "My first node"
