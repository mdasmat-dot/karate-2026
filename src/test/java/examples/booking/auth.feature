Feature: Flujo auth

  @token
  Scenario: CP01-Create token-OK
    Given url "https://restful-booker.herokuapp.com"
    And path "/auth"
    And request {"username": "admin", "password": "password123"}
    When method post
    Then status 200
    * def token = response.token
    * print response
    * print token



  Scenario Outline: CP02-<nombre>-NOK
    Given url "https://restful-booker.herokuapp.com"
    And path "/auth"
    And request {"username": <username>, "password": <password>}
    When method post
    Then status 200
    And match response.reason == "Bad credentiasl"
    Examples:
    |username|password|nombre|
    |admin   |pasword000| Contraseña incorrecta|
    |carlos  |pasword123|Usuario incorrecto    |


  @token-parameter
  Scenario: CP01-Create token-OK
    Given url "https://restful-booker.herokuapp.com"
    And path "/auth"
    And request {"username": #(user), "password": #(pass)}
    When method post
    Then status 200
