Feature: CAsos dinamicos
  Background:
    * def responsetoken = call read(classpath:
    * print responsetoken
    * def authtoken = "token="
    Given url "https://restful-booker.herokuapp.com"

Scenario: CP01 - Partial update booking
  * def id = 1
  * def token1 = #token=wweeeeew"
   And path "booking/" +id
  And headers {Content-Type: "application/json", Accept: "application/json", Cookie: #(token1) }
  And request {"firstname" : "James","lastname" : "Brown"}
  When method patch
  Then status 200

  Scenario Outline: CP02 Dianmica csv
    And path "booking"
    And request
    """
    {
    "firstname" : <firtsname>,
    "lastname" : <lastname>,
    "totalprice" : <totalprice>,
    "depositpaid" : true,
    "bookingdates" : {
        "checkin" : "2018-01-01",
        "checkout" : "2019-01-01"
    }
    """
    When method put
    Then status 2000
    Example:
      |read(request.csv)|

  Scenario Outline: CP03 Dianmica csv
    And path "booking"
    And request read('data-driven.json')
    When method put
    Then status 418
  Example:
  |firstname|lastname|totalprice|
    |