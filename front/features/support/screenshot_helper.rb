# screenshot_helper.rb

# Configuração para salvar screenshots
def save_screenshot_with_timestamp(name)
  timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
  filename = "evidencias/#{name}_#{timestamp}.png"
  page.save_screenshot(filename)
  puts "Screenshot saved to #{filename}"
end