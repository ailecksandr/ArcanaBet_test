# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ArcaneTest
  class Application < Rails::Application
    LIB = 'lib'

    config.load_defaults 5.2

    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join(LIB)

    config.generators.system_tests = nil
  end
end
