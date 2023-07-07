Feature: JSON Schema Validation

Scenario: Get a Single User and Verify its JSON Fields
Given url 'https://reqres.in/api/users/2'
When method GET
Then match response == '#object'
* def jsonSchemaExpected = 
"""
    {
    "data": {
        "id": '#number',
        "email": "#string",
        "first_name": "#string",
        "last_name": "#string",
        "avatar": "#string"
    },
    "support": {
        "url": "#string",
        "text": "#string"
    }
}
"""
* match response == jsonSchemaExpected   

