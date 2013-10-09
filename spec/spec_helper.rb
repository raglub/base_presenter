ENV["RAILS_ENV"] ||= 'test'

require "rails/all"
require 'base_presenter'
# Define the application and configuration
class Application < ::Rails::Application
  # config.active_support.deprecation = :stderr
end
# Initialize the application
Application.initialize!

require_relative "dummy/app/helpers/dummy_helper.rb"
require_relative "dummy/app/models/dummy.rb"
require_relative "dummy/app/presenters/dummy_presenter.rb"

RSpec.configure do |config|
  config.color_enabled = true
  config.tty = true
end
