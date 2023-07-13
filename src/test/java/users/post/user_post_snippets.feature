@ignore
Feature:  Reusable scenarios for post a user

@Create
  Scenario:
    Given url "https://reqres.in" + "/api/users/"
    And request { "name": "Camilo Perez", "job": "Testing QA Leader" }
    When method post
    Then status 201
    # obtener el id del usuario creado y almacenarlo en variables
    And def contactId = $.id