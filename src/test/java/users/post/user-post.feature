Feature: Post user on reqres

  Background:
    #pasos que deben de ejecutarse igual en todos los escenarios
    * url "https://reqres.in"
    * path "/api/users/"
    # crear variables que se le ingresa varios valores
    * def var2 = { "name": "#(name)", "job": "#(job)" }


  Scenario: Post a user
    #para crear variables con json almacenado
    * def var = { "name": "Pepito Perez", "job": "Testing QA" }
    Given request var
    When method post
    Then status 201


  Scenario: Post a user without job
    And request { "name": "Pepito"}
    When method post
    Then status 201


  Scenario: Post a user with name invalid
    And request { "name": "$%&/%$#", "job": "Doctor" }
    When method post
    Then status 201


  Scenario Outline: Post a user
    Given request var2
    When method post
    Then status 201

    Examples:
    |name|job|
    |juan|leader|
    |carlos|doctor|
    |gustavo|teacher|

