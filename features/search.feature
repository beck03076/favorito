# Feature: Perform the search and get results
#   In order to get a list of languages used and the users favorite programming language
#   As a Visitor
#   I want to search with the username and get valid results from github api
#
#   Scenario: Search with a valid username and get favorite laungauge
#     Given I am on the homepage
#     And I fill in the form with "beck03076"
#     When I press "Search"
#     And wait for the results
#     Then I should see "The favorito language for beck03076 is ruby"
#
#   Scenario: Search with a valid username and get list of all languages
#     Given I am on the homepage
#     And I fill in the form with "beck03076"
#     When I press "Search"
#     And wait for the results
#     Then I should see "Programming Languge"
#     Then I should see "Number of Repositories"
#
