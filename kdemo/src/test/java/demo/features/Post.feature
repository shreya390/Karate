
Feature: POST API DEMO
Background:
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def expectedOutput = read('response1.json')

# Simple Post scenario
Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request { "name": "Shreya", "job": "leader"}
    When method post
    Then status 201
    And print response

# Post scenario with Background
Scenario: Post demo 2
    Given path '/users'
    And request { "name": "Shreya", "job": "leader"}
    When method post
    Then status 201
    And print response

# Post with response assertion
Scenario: Post demo 3
    Given path '/users'
    And request { "name": "Shreya", "job": "leader"}
    When method post
    Then status 201
    And match response == {"name": "Shreya", "job": "leader","id": "#string","createdAt": "#ignore"}

# Post with response matching from file
Scenario: Post demo 4
    Given path '/users'
    And request { "name": "Shreya", "job": "leader"}
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

# Read body data from file
Scenario: Post demo 5
    Given path '/users'
    And def requestBody = read('userdata.json')
    And request requestBody
    When method post
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

# Read body data from file relative path
Scenario: Post demo 6
    Given path '/users'
    And def projectPath = karate.properties['user.dir'] 
    #karate.properties[‘user.dir’] which will automatically pick user’s working directory and then append it to the path of our project files.
    And print projectPath
    And def filePath = projectPath+'kdemo/src/test/java/demo/data/userdata.json'
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1
    When method post
    Then status 201
    And print response

# Read body data from file and change request values
Scenario: Post demo 7
    Given path '/users'
    And def requestBody = read('response1.json')
    And request requestBody
    And set requestBody.job = 'engineer'
    When method post
    Then status 201
    And print response
    And match response.job != 'leader'