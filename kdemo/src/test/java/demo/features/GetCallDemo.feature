@debug
Feature: Test demo API
    Background:
        * url 'https://reqres.in/api'
        * header Accept = 'application/json'
    Scenario: Run a sample Get API
        Given url 'https://reqres.in/api/users?page=2'
        When method GET
        Then status 200

    Scenario: Get demo1
        Given url 'https://reqres.in/api/users?page=2'
        When method GET
        Then status 200
        And print response
        And print responseStatus
        And print responseHeaders
        And print responseTime
        And print responseCookies

    # With Background  and Path
    Scenario: Get demo 2
        Given path '/users/2'
        When method GET
        Then status 200

    # With Background, path and params
    Scenario: Get demo 3
        Given path '/users'
        And param page = 2
        When method GET
        Then status 200

    # With Assertions
    Scenario: Get demo 4
        Given path '/users'
        And param page = 2
        When method GET
        Then status 200
        And match response.data[0].first_name != null
        And match $.data[1].id == '#number'
        And match $.data[3].last_name == '#string'

    Scenario Outline: GET demo 5
        Given path '/users', id
        When method GET
        Then status 200
        Examples:
            | id |
            | 3  |
            | 4  |
            | 5  |