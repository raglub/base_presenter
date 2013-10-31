ENV["RAILS_ENV"] ||= 'test'

require ::File.expand_path('../dummy/config/environment', __FILE__)
require 'rspec/rails'
require 'base_presenter'
require_relative 'support/dummy_model_presenter'

require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end
