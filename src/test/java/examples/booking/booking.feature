Feature: Booking
  Scenario: Cp01 - Filter booking by check
    Given url "https://restful-booker.herokuapp.com"
    And path "booking"
    And params {checkin: 2014-03-13, checkout.2014-05-21}
    When method get
    Then status 200

    Scenario: Cp03 - Ejemplo 2
      Given url "https://restful-booker.herokuapp.com"
      And path "/booking"
      And params {firstname:sally, lastname=brown}
      When method get
      Then status 200
      Scenario Outline: Cp04 - Buscar booking con diferentes parametros
        Given url "https://restful-booker.herokuapp.com"
        And path 'booking'
        And param firstname = '<firstname>'
        And param lastname = '<lastname>
        When method get
        Then status 200
        Examples:
          |firstname|lastname|
          |Jim|Brown|
          |Susan|Wilson|
          |Mary|Smith|

        Scenario: Cp03 - Booking
          Given url "https://restful-booker.herokuapp.com"
          And path "/booking"
          When method get
          Then status 200
          And match each response[*].bookingid == "#number"

        Scenario: Cp05 - getbookingId-OK
          * def id = 1
          Given url "https://restful-booker.herokuapp.com"
          And path "/booking" + id
          When method get
          Then status 418


          Scenario: Cp06 - Actualizar booking
            * def datos = read('schema.json')
            * def id = 1
            Given url "https://restful-sibooker.herokuapp.com"
            And header Content-Type = "application/json"
            And header Accept = "application/json"
            And header Cookie = "token=abc123"
            And path "/booking/" + id
            And request datos
            When method put

  Scenario: Cp07 - Update booking m
    * def id = 1
    * def datosdelbody = read('Updatebody.json')
    Given url "https://restful-booker.herokuapp.com"
    And path "booking", id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token=ed95559dc19195d'
    And request datosdelbody
    When method put
    Then status 200
    And match response.firstname == datosdelbody.firstname


    Scenario: CP06 - Create Booking LC
      * def bodybooking = read('booking.json')
      Given url "https://restful-booker.herokuapp.com/"
      And path "booking"
      And request  bodybooking
      When method post
      Then status 200
      And match response == read('schema.json')
      And match response.booking == bodybooking

  Scenario: CP05 - Update booking
    Given url "https://restful-booker.herokuapp.com"
    And path "booking", id
    And header Content-Type = 'application/json'
    And header Accept = 'application/json'
    And header Cookie = 'token=644ef0759610301'
    And request datosdelbody
    When method put
    Then status 200
    And match response.firstname == datosdelbody.firstname




