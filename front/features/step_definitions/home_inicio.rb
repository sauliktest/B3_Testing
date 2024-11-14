Dado('usuario esteja na area logada') do
  screen_home_inicio.load
  expect(screen_home_inicio).to be_loaded
end

Quando('selecionar o {string}') do |menu|
  screen_home_inicio.acessar_menu(menu)
end

Então('o sistema exibe corretamente o {string}') do |nome_exibido|
  screen_home_inicio.valida_nome_tela(nome_exibido)
end

#validaçao dos elementos
Quando('navegar para a aba Enter Vehicle Data') do
  screen_home_inicio.acesso_aba_Enter_Vehicle_Data
end

Então('todos os elementos devem estar acessiveis') do
 screen_home_inicio.valida_elementos_aba_Enter_Vehicle_Data
end

Quando('concluir o processo de cadastro') do
  
  screen_home_inicio.cad_form_Enter_Insurant_Data
end

Então('o perfil do usuário é gravado na base de dados') do
 pp "Informações inseridas...."
end
