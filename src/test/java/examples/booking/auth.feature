Feature: Create toke
  Scenario: CP03-Create token-OK
    Given url "https://restful-booker.herokuapp.com"
    And path "/auth"
    And request {"username": #(user), "password": #(pass)}
    When method post
    Then status 200
    And match response.token == "#string"
    * def token = response.token