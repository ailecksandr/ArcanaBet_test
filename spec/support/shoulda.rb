# frozen_string_literal: true

Shoulda::Matchers.configure do |config|
  config.integrate { |with| with.test_framework :rspec }
end
