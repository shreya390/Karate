Feature: Basic Aunthentication

Scenario: Basic validation
    Given url "https://postman-echo.com"
    And path "basic-auth"
    * header Authorization = call read('basicAuth.js') { username: 'postman', password: 'password' }
    When method GET
    Then status 200
    And print response
    
Scenario: Basic failure
    Given url "https://postman-echo.com"
    And path "basic-auth"
    * header Authorization = call read('basicAuth.js') { username: 'postman', password: 'password123' }
    When method GET
    Then status 401
    And print response
    And match response == 'Unauthorized'
    