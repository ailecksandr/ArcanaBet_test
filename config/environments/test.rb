default_assets_cache_lifetime = 1.hour.to_i
default_host                  = 'localhost'
default_port                  = 3000

Rails.application.configure do
  config.action_controller.allow_forgery_protection = false
  config.action_controller.perform_caching          = false

  config.action_dispatch.show_exceptions            = false

  config.action_mailer.default_url_options          = { host: default_host, port: default_port }
  config.action_mailer.delivery_method              = :test
  config.action_mailer.perform_caching              = false

  config.active_support.deprecation                 = :stderr
  config.assets.debug                               = true

  config.cache_classes                              = true
  config.consider_all_requests_local                = true
  config.eager_load                                 = false

  config.public_file_server.enabled                 = true
  config.public_file_server.headers                 = {
    'Cache-Control' => "public, max-age=#{default_assets_cache_lifetime}"
  }
end
