# language: pt
# utf-8

@regression_home_inicio
Funcionalidade: Acesso a Home 
  Eu como usuário quero logar no site e acessar as funcionalidades

  Contexto: 
    Dado usuario esteja na area logada

  @smoke_principal
  Esquema do Cenário: Acesso aos menus 
    Quando selecionar o "<menu>"
    Então o sistema exibe corretamente o "<nome_exibido>"

  Exemplos:
    | menu        |    nome_exibido        |
    | Automobile  | Automobile Insurance   |  
    | Truck       | Truck Insurance        |
    | Motorcycle  | Motorcycle Insurance   |
    | Camper      | Camper Insurance       |
   

@valida_elementos
Cenário: Validar os elementos da aba Enter Vehicle Data
 Quando navegar para a aba Enter Vehicle Data
 Então todos os elementos devem estar acessiveis


@cad_user
Cenário: Cadastrar usuario
Quando concluir o processo de cadastro
Então o perfil do usuário é gravado na base de dados


