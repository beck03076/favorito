Feature: Use the search form
  In order to find an users favorite programming language
  As a Visitor
  I want to enter username in the form and start the search

  Scenario: Search for an empty username
    Given I am on the homepage
    And I fill in the form with ""
    When I press "Search"
    Then I should see "Please enter an username before clicking on Search"
#
#   Scenario: Search for an invalid username format
#     Given I am on the homepage
#     And I fill in the form with "beck--03076"
#     When I press "Search"
#     Then I should see "The format of this username is wrong!"
#
#   Scenario: Search for a valid format, non existing username on github
#     Given I am on the homepage
#     And I fill in the form with "beck0307692473audfh29347sdkfh56sidefg268sidefg2483567"
#     When I press "Search"
#     Then I should see "This user does not exist on Github!"
#
