Feature: API Key Aunthentication

Scenario: API Key Validation

    Given url "https://calendarific.com"
    And path "/api/v2/countries"
    And params { 'api key' : '101f0b037191ee3392245eeebeabf124b1733693'}
    When method GET
    Then status 200
    And print response
    