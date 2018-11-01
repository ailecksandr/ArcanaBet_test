# frozen_string_literal: true

Rails.application.configure do
  config.assets.version                  = '1.1'
  config.assets.initialize_on_precompile = false

  config.assets.paths << Rails.root.join('node_modules')
end
