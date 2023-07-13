Feature: Delete user on reqres


  Scenario: Delete a user
    Given url "https://reqres.in" + "/api/users/" + "2"
    When method delete
    Then status 204


    # reutilizar escenarios de otro feature
    # 1. Crea el usuario en el feature user_post_snippets, metodo con etiqueta @Create
    # 2. Desde este metodo delete se hace llamado al feature con su etiqueta para el metodo que se va a ejecutar
    # 3. Se extrae el id del usuario recien creado
    # 4. Y realiza el metodo delete a partir de este Id

  Scenario: Delete a user reusable
    * call read("../post/user_post_snippets.feature@Create")
    Given url "https://reqres.in" + "/api/users/" + contactId
    When method delete
    Then status 204

