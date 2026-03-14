Feature: Request and response

  Scenario: CP 01 - Actualizar mascota
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
    And request read ('bodyPet.json')
    When method put
    Then status 200
    And match $.id == 111

Scenario: CP02 - Actualizar mascota v2
  * def bodyPet = read('bodyPet.json')
  Given url "https://petstore.swagger.io/v2"
  And path '/pet'
  And request bodyPet
  When method put
  Then status 200
  * print bodyPet"
  And match $.id == bodyPet.id
  And match $ == bodyPet

  Scenario: CP03 - Create token
    Given url "https://restful-booker.herokuapp.com"
    And path "/auth"
    And header Content-type = "application/json"
    And request {"username" : "admin","password" : "password123"}
    When method post
    Then status 200
    And match $.token == "#string"
    And match responseType == "json"

    Scenario:CP04 - Actualizar mascota por ID
      * def paramPet = read('parameterPet.json')
      Given url "https://petstore.swagger.io/v2"
      And path "/pet/:petId"
      And path '/path/'+ paramPet.id
      And form field name = paramPet.name
      And form field status = paramPet.status
      When method post
      Then status 200
      And match $. == paramPet.Id









