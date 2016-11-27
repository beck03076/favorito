# Favorito

Favorito translates to **Favorite in Portuguese**(at least that's what google says)

So well, this is a full fledged ruby on rails application that can be started on your local server and was developed with a Behaviour Driven and Test First Approach. Also called as Outside In Development.(In simple english, you write your features first, then work your way into writing the tests for models/libraries and controllers and make all tests green)

# User stories and Design Diagram

Based on the code assignment's problem description, user stories with features and scenarios are captured in a pdf document and also assuming these stories as the problem statement, a thorough human-friendly design diagram representing the proposed solution is included in the same pdf file. This design diagram shows how this core rails app, favorito is design and implemented in a object oriented dimension.

# How to Start

Use the following commands to start the rails app on your local server

* $ git clone https://github.com/beck03076/favorito
* $ cd favorito
* $ rails server -p 3000

# How to Use

Once the app is started, just enter a github username in the search form and that's it, you will see the favorito finding the favorite programming language of the github user.

# How to run the test suite

Use the following commands to run the test suites

$ cd favorito
$ rspec
$ rake cucumber

# Tests Coverage

Once your run $ rspec then the commandline will generate the tests coverage under coverage direct

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
