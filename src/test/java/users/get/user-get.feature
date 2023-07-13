Feature: Get user on reqres


  Scenario: Get a user
    Given url "https://reqres.in" + "/api/users/" + "2"
    When method get
    Then status 200


  Scenario: Get a list of user
    # variable para llamar el archivo tipo Json que es la respuesta que espera validar el escenario
    * def jsonResponse = read('../json/List_of_users.json')
    Given url "https://reqres.in/api/users?page=1"
    When method get
    Then status 200
    # hace dos validaciones en una se envia todo el json para comparar la respuesta
    # en la otra valida que el json respuesta sea el mismo que el archivo .json
    # tres formas de validar si el json esperado es igual al generado por el escenario
    And match $ == {"page":1,"per_page":6,"total":12,"total_pages":2,"data":[{"id":1,"email":"george.bluth@reqres.in","first_name":"George","last_name":"Bluth","avatar":"https://reqres.in/img/faces/1-image.jpg"},{"id":2,"email":"janet.weaver@reqres.in","first_name":"Janet","last_name":"Weaver","avatar":"https://reqres.in/img/faces/2-image.jpg"},{"id":3,"email":"emma.wong@reqres.in","first_name":"Emma","last_name":"Wong","avatar":"https://reqres.in/img/faces/3-image.jpg"},{"id":4,"email":"eve.holt@reqres.in","first_name":"Eve","last_name":"Holt","avatar":"https://reqres.in/img/faces/4-image.jpg"},{"id":5,"email":"charles.morris@reqres.in","first_name":"Charles","last_name":"Morris","avatar":"https://reqres.in/img/faces/5-image.jpg"},{"id":6,"email":"tracey.ramos@reqres.in","first_name":"Tracey","last_name":"Ramos","avatar":"https://reqres.in/img/faces/6-image.jpg"}],"support":{"url":"https://reqres.in/#support-heading","text":"To keep ReqRes free, contributions towards server costs are appreciated!"}}
    And match $ == jsonResponse
    And match $ == read('../json/List_of_users.json')


