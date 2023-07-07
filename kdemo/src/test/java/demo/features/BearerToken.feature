Feature: Bearer token validation

Scenario: Validation using Bearer token
* def tokenID = '94120e9960c309eae23dc20b5cfce4c7c790e09f2499b11d8446d3d40abff504'
* def baseUrl1 = 'https://gorest.co.in'
Given url baseUrl1+'/public/v1/users'
And  header Authorization = 'Bearer' + tokenID
When method Get
Then status 200