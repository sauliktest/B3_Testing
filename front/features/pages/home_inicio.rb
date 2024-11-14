class ScreenHomeInicio < SitePrism::Page
  include RSpec::Matchers

  set_url 'http://sampleapp.tricentis.com/101/app.php'

  #################### MENUS #####################################################
  element :menu_automobile, 'a#nav_automobile'
  element :menu_truck, 'a#nav_truck'
  element :menu_motorcycle, 'a#nav_motorcycle'
  element :menu_camper, 'a#nav_camper'

  ################## Nome exibido #############################
  element :label_menu, 'span#selectedinsurance' # Um único elemento que captura o nome exibido

  ################## Formulários #########################
  element :form_enter_vehicle_data, 'a#entervehicledata'
  element :form_enter_insurant_data, 'a#enterinsurantdata'

   ################## Campos de Inputs #########################

   #******** formulário Enter Vehicle Data
   element :campo_selecao_make, 'select#make'
   element :campo_engine_performance, 'input#engineperformance'
   element :campo_data_of_manufacture, 'button#opendateofmanufacturecalender'
   element :campo_number_of_seats, 'select#numberofseats'
   element :campo_fuel_type, 'select#fuel'
   element :campo_list_price, 'input#listprice'
   element :campo_license_plate_number, 'input#licenseplatenumber'
   element :campo_annual_mileage, 'input#annualmileage'

   #************ formulário Enter Insurate Data ********************#
   element :campo_first_name, '#firstname'
   element :campo_last_name,  '#lastname'
   element :campo_birth_date, 'input#birthdate'
   element :campo_street_address, 'input#streetaddress'
   element :campo_country, 'select#country'
   element :campo_zipcode, 'input#zipcode'
   element :campo_city, 'input#city'
   element :campo_occupation, 'select#occupation'
   element :campo_website, 'input#website'
   element :botao_next_enter_product_data, 'button#nextenterproductdata'

   ################## Botões #########################
   element :botao_next_enter_insurant_data, 'button#nextenterinsurantdata'

  ################## Labels #########################
  element :lbl_make, 'label.main', text: 'Make'
  element :lbl_engine_performance, 'label.main', text: 'Engine Performance [kW]'
  element :lbl_date_of_manufacture, 'label.main', text: 'Date of Manufacture'
  element :lbl_fuel_type, 'label.main', text: 'Fuel Type'
  element :lbl_list_price, 'label.main', text: 'List Price [$]'
  element :lbl_license_plate_number, 'label.main', text: 'License Plate Number'
  element :lbl_annual_mileage, 'label.main', text: 'Annual Mileage [mi]'

     # Métodos
  def acessar_menu(menu)
    case menu
    when 'Automobile'
      wait_until_menu_automobile_visible
      menu_automobile.click
    when 'Truck'
      wait_until_menu_truck_visible
      menu_truck.click
    when 'Motorcycle'
      wait_until_menu_motorcycle_visible
      menu_motorcycle.click
    when 'Camper'
      wait_until_menu_camper_visible
      menu_camper.click
    else
      raise "Menu '#{menu}' não encontrado"
    end
  end

  # Valido se o nome exibido está correto
  def valida_nome_tela(nome_exibido)
    label_menu.highlight
    expect(label_menu.text).to eq(nome_exibido)
  end


  def acesso_aba_Enter_Vehicle_Data
    menu_automobile.highlight
    menu_automobile.click
    #form_enter_vehicle_data.highlight
    form_enter_vehicle_data.click
    expect(form_enter_vehicle_data.text.match(/^Enter Vehicle Data$/).to_s).to eq("Enter Vehicle Data")
  end

  def valida_elementos_aba_Enter_Vehicle_Data
    # valida se os elementos de input estão interagives
    campo_selecao_make.click
    campo_selecao_make.select("BMW")
    campo_engine_performance.click
    campo_engine_performance.set("1000")
    campo_data_of_manufacture.set("11/12/2024")
    campo_number_of_seats.select("5")
    campo_fuel_type.select("Petrol")
    campo_list_price.set("500")
    campo_license_plate_number.set("15")
    campo_annual_mileage.set("100")

    #valida se os elementos estão visiveis e se os texto estão corretos
    expect(lbl_make.visible?).to be true
    expect(lbl_make.text).to eq('Make')

    expect(lbl_engine_performance.visible?).to be true
    expect(lbl_engine_performance.text).to eq('Engine Performance [kW]')

    expect(lbl_date_of_manufacture.visible?).to be true
    expect(lbl_date_of_manufacture.text).to eq('Date of Manufacture')

    expect(lbl_fuel_type.visible?).to be true
    expect(lbl_fuel_type.text).to eq('Fuel Type')

    expect(lbl_list_price.visible?).to be true
    expect(lbl_list_price.text).to eq('List Price [$]')

    expect(lbl_license_plate_number.visible?).to be true
    expect(lbl_license_plate_number.text).to eq('License Plate Number')

    expect(lbl_annual_mileage.visible?).to be true
    expect(lbl_annual_mileage.text).to eq('Annual Mileage [mi]')

    # Verificando se o botão existe e se o texto esta correto
    expect(botao_next_enter_insurant_data).to be_visible
    pp expect(botao_next_enter_insurant_data.text).to eq('Next »')
    pp botao_next_enter_insurant_data.text
    botao_next_enter_insurant_data.click
   end

  def cad_form_Enter_Insurant_Data
  form_enter_insurant_data.click
  campo_first_name.set(DADOS[:users][:user_valido][:f_name]).send_keys(:tab)
  campo_last_name.set(DADOS[:users][:user_valido][:l_name]).send_keys(:tab)
  campo_birth_date.set(DADOS[:users][:user_valido][:Date_of_Birth]).send_keys(:tab)
  page.execute_script("document.getElementById('gendermale').click()")
  campo_street_address.set(DADOS[:users][:user_valido][:street_address]).send_keys(:tab)
  #campo_country.select('Brazil')
  campo_country.select(DADOS[:users][:user_valido][:country].strip)
  campo_zipcode.set(DADOS[:users][:user_valido][:zipcode]).send_keys(:tab)
  campo_city.set(DADOS[:users][:user_valido][:city]).send_keys(:tab)
  campo_occupation.select(DADOS[:users][:user_valido][:occupation].strip)
  page.execute_script("document.getElementById('bungeejumping').click()")
  campo_website.set(DADOS[:users][:user_valido][:website]).send_keys(:tab)
  #botao_next_enter_product_data.click
  end
end
