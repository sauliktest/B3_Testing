require_relative 'screenshot_helper'
require 'rspec'
require 'capybara/rspec'
require 'pry'
require 'cucumber'
require 'webdrivers'
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'bundler'
require 'report_builder'
require 'json'
require 'site_prism'
require 'site_prism/all_there'
require_relative 'helper.rb'
require 'erb'
require 'json'
require 'dbi'
require 'rails'
require 'execjs'
require 'date'
#require 'oci8'
require 'sequel'

World(PageObjects)
#World(Conexao_BD)

BROWSER = ENV['BROWSER']
#DADOS = YAML.load(File.open(File.join(File.dirname(__FILE__) + "/massa/users.yml")))

DADOS = {
  #ficha_compensacao: YAML.load(File.open(File.join(File.dirname(__FILE__) + "/massa/ficha_compensacao.yml"))),
  users: YAML.load(File.open(File.join(File.dirname(__FILE__) + "/massa/users.yml")))
}

# Registro do driver para o Chrome Headless
Capybara.register_driver :selenium_chrome_headless do |app|
  Capybara::Selenium::Driver.load_selenium
  browser_options = ::Selenium::WebDriver::Chrome::Options.new.tap do |opts|
    opts.args << "--headless"
    opts.args << "--disable-gpu"
    opts.args << "--no-sandbox"
    opts.args << "--disable-site-isolation-trials"
    opts.args << "--disable-dev-shm-usage"
  end

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    options: browser_options
  )
end

# Registro do driver para o Firefox
Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.load_selenium
  firefox_options = ::Selenium::WebDriver::Firefox::Options.new
  firefox_options.binary = 'C:\Program Files\Mozilla Firefox\firefox.exe'

  Capybara::Selenium::Driver.new(
    app,
    browser: :firefox,
    options: firefox_options
  )
end

Capybara.configure do |config|
  case BROWSER
  when 'chrome'
    driver = :selenium_chrome
  when 'chrome_headless'
    driver = :selenium_chrome_headless
  when 'firefox'
    driver = :selenium_firefox
  when 'firefox_headless'
    driver = :selenium_headless # Certifique-se de que esse driver está registrado, se necessário
  when 'safari'
    driver = :safari
  when 'ie'
    driver = :ie
  when 'edge'
    driver = :edge
  end

  # Setando a configuração do Driver como padrão.
  Capybara.default_driver = driver
  # Timeout padrão na execução.
  Capybara.default_max_wait_time = 15
  # Maximizar a tela ao iniciar o teste.
  Capybara.page.current_window.resize_to(1920, 1080)
  #Capybara.page.driver.browser.manage.window.maximize
end
