Feature: Ejercicios Basicos

  Scenario: CP01 - Login exitoso
    Given url 'https://petstore.swagger.io/v2'
    And path '/user/login'
    And param username = 'admin'
    And param password = '123456'
    When method get
    Then status 200
    
    Scenario: CP02 - Crear Orden
      Given url 'https://petstore.swagger.io/v2'
      And path '/store/order'
      And request
      """
      {
       "id": 0,
       "petId": 0,
       "quantity": 0,
       "shipDate": "2026-03-02T23:07:37.278Z",
       "status": "placed",
       "complete": true
      }
      """
      When method post
      Then status 200

      Scenario: CP - 03 Crear Registro con variable
        * def bodyOrder =
         """
      {
       "id": 0,
       "petId": 0,
       "quantity": 0,
       "shipDate": "2026-03-02T23:07:37.278Z",
       "status": "placed",
       "complete": true
      }
      """
        Given url 'https://petstore.swagger.io/v2'
        And path '/store/order'
        And request bodyOrder
        When method post
        * print bodyOrder
        * print 'Hola esto es una prueba:{}' , response
        Then status 200


        Scenario: CP -04 Actualizar informacion Mascotas
          Given url 'https://petstore.swagger.io/v2'
          And path /user/login
          And request
          """
          {
           "id": 0,
           "category": {
           "id": 0,
           "name": "string"
          },
            "name": "doggie",
            "photoUrls": [
            "string"
          """
          When method put
          Then status 200
          And match response.category.name == 'dog'
          And match response.status == 'available'

          Scenario: CP - 05 Ubicacion por Status
            Given url 'https://petstore.swagger.io/v2'
            And path '/pet/findByStatus'
            And param status = 'sold'
            When method get
            * print response
            Then status 200
            And match each response[*].id == '#number'
            And match each response[*].name == '#string'
            And match each response[*].status == 'sold'

  Scenario: CP - 06 Ubicacion por Status
    * def filter = "pending"
    Given url 'https://petstore.swagger.io/v2'
    And path '/pet/findByStatus'
    And param status = 'sold'
    When method get
    * print response
    Then status 200
    And match each response[*].id == '#number'
    And match each response[*].name == '#string'
    And match each response[*].status == filter