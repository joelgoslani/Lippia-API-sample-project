Feature: Workspace
  COMO usuario de Clockify
  QUIERO ver las configuraciones de mi Worckspace
  PARA llevar un buen control de mis horas de trabajo y el de mis empleados

  Scenario Outline: Consulta Project resultado exitoso
    Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    @Project
    Examples:
      | operation | entity  | jsonName   | status |
      | GET       | PROJECT | project/rq | 200    |

  Scenario Outline: Consulta Project resultado erroneo
    Given X-Api-Key invalido
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    @Project
    Examples:
      | operation | entity  | jsonName   | status |
      | GET       | PROJECT | project/rq | 401    |

  Scenario Outline: Update cambio de nombre Project
    When I perform a 'PUT' to '<entity>' endpoint with the 'project/rq_put' and ''
    Then se valida el cambio de nombre 'Curso Automation 5' en el project
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se valida la cantidad de projects
    Then El project con el nombre '<nombre>' se encuentra en la lista
    @Project
    Examples:
      | operation | entity  | jsonName   | status | nombre             |
      | GET       | PROJECT | project/rq | 200    | Curso Automation 5 |
      #| GET       | PROJECT | project/rq | 200    | Crowdar          |

  Scenario Outline: Consulta Project resultado: Status <status>
    Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se obtuvo el response esperado en <entity> con el <response>
    @Project
    Examples:
      | operation | entity | jsonName       | status | response       |
      | GET       | ERROR  | project/rq_401 | 401    | Project/rs_401 |


  Scenario Outline: Consulta Project parametrizado exitoso
    Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'key:<key>,workspace:<workspace>'
    And se obtuvo el status code <status>
    @Project
    Examples:
      | operation | entity  | jsonName         | status | key                                              | workspace                |
      | GET       | PROJECT | project/rq_param | 200    | OWY0MzM4YjYtODM2OC00MmRjLTlhZDEtODE3N2M1NzkzMTI4 | 6306404cd5efc140a0393f03 |

  Scenario Outline: Consulta Project parametrizado 2 exitoso
    Given Un api-key valido
    And Un workspace ID
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    @Project @prueba
    Examples:
      | operation | entity  | jsonName         | status |
      | GET       | PROJECT | project/rq_param | 200    |