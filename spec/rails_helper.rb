# frozen_string_literal: true

require 'spec_helper'
require 'faker'
require 'capybara/rspec'
require 'shoulda/matchers'
require 'dotenv'

ENV['RAILS_ENV'] ||= 'test'
ENV['NODE_ENV'] ||= 'test'
Dotenv.load('.env.test')

require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production? || Rails.env.staging?

require 'rspec/rails'

%w[
  spec/support/*.rb
  spec/shared_examples/**/*.rb
].each { |path| Dir[Rails.root.join(path)].each(&method(:require)) }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.before(:suite) { Rails.application.load_tasks }

  config.include Shoulda::Matchers::ActiveModel,       type: :model
  config.include Shoulda::Matchers::ActiveRecord,      type: :model
  config.include Rails.application.routes.url_helpers, type: :form
end
