Feature: Test de API súper simple

  Background:
    * configure ssl = true

  @id:1 @ObtenerTodosLosPersonajes
  Scenario Outline: T-API-BTHB-1111-CA1- Obtener Todos Los Personajes
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters'
    When method GET
    Then status 200
    * print response
    Examples:
      | dummy |
      | 1 |

  @id:2 @ObtenerPersonajePorId
  Scenario Outline: T-API-BTHB-1111-CA1- Obtener Personaje por ID
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters/4'
    When method GET
    Then status 200
    * print response
    Examples:
      | dummy |
      | 1 |

  @id:3 @ObtenerPersonajePorIdNoExiste
  Scenario Outline: T-API-BTHB-1111-CA1- Obtener Personaje por ID No Existe
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters/999'
    When method GET
    Then status 404
    * print response
    Examples:
      | dummy |
      | 1 |

  @id:4 @CrearPersonaje
  Scenario: T-API-BTHB-1111-CA1- Crear Personaje Exitoso
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters'
    And def personaje = read('classpath:../data/personajes/CrearPersonaje.json')
    And request personaje
    When method POST
    Then status 201
    * print response

    @id:5 @CrearPersonajeDuplicado
    Scenario: T-API-BTHB-1111-CA1- Crear Personaje Duplicado
      * header content-type = 'application/json'
      * header x-session = 'aaa'
      * header x-app = '09106'
      * header x-medium = '020002'
      * header x-channel = '10'
      * header x-device = 'aaa'
      * header x-device-ip = '0.0.0.0'
      * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
      Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters'
      And def personaje = read('classpath:../data/personajes/CrearPersonajeDuplicado.json')
      And request personaje
      When method POST
      Then status 400
      * print response

  @id:6 @CrearPersonajeFaltaNombre
  Scenario: T-API-BTHB-1111-CA1- Crear Personaje Falta Nombre
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters'
    And def personaje = read('classpath:../data/personajes/CrearPersonajeFaltaNombre.json')
    And request personaje
    When method POST
    Then status 400
    * print response

  @id:7 @ActualizarPersonaje
  Scenario: T-API-BTHB-1111-CA1- Actualizar Personaje
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters/4'
    And def personaje = read('classpath:../data/personajes/ActualizarPersonaje.json')
    And request personaje
    When method PUT
    Then status 200
    * print response

  @id:8 @ActualizarPersonajeNoExiste
  Scenario: T-API-BTHB-1111-CA1- Actualizar Personaje No Existe
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters/999'
    And def personaje = read('classpath:../data/personajes/ActualizarPersonajeNoExiste.json')
    And request personaje
    When method PUT
    Then status 404
    * print response

  @id:9 @EliminarPersonaje
  Scenario: T-API-BTHB-1111-CA1- Eliminar Personaje
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters/6'
    When method DELETE
    Then status 200
    * print response

  @id:10@EliminarPersonajeNoExiste
  Scenario: T-API-BTHB-1111-CA1- Eliminar Personaje No Existe
    * header content-type = 'application/json'
    * header x-session = 'aaa'
    * header x-app = '09106'
    * header x-medium = '020002'
    * header x-channel = '10'
    * header x-device = 'aaa'
    * header x-device-ip = '0.0.0.0'
    * header x-guid = '550e8400-e29b-41d4-a716-446655400000'
    Given url 'http://bp-se-test-cabcd9b246a5.herokuapp.com/lgualanc/api/characters/999'
    When method DELETE
    Then status 404
    * print response