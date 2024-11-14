# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper.rb"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration

$: << '../lib'
require 'rspec'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require 'timecop'

RSpec.configure do |config|
  if RSpec::Core::Version::STRING.to_i == 2
    config.treat_symbols_as_metadata_keys_with_true_values = true
  end
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.before do
    @aruba_timeout_seconds = 60
  end if RUBY_PLATFORM == 'java'
end

Capybara.app = lambda { |env| [200, {}, ["OK"]] }
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if RUBY_VERSION < '1.9.3'
  ::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each { |f| require File.join(File.dirname(f), File.basename(f, '.rb')) }
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require File.join(File.dirname(f), File.basename(f, '.rb')) }
else
  ::Dir.glob(::File.expand_path('../support/*.rb', __FILE__)).each { |f| require_relative f }
  ::Dir.glob(::File.expand_path('../support/**/*.rb', __FILE__)).each { |f| require_relative f }
end
