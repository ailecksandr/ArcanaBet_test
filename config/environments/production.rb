Rails.application.configure do
  config.active_record.dump_schema_after_migration = false

  config.active_support.deprecation                = :notify

  config.assets.js_compressor                      = Uglifier.new(harmony: true)
  config.assets.compile                            = false

  config.cache_classes                             = true

  config.consider_all_requests_local               = false
  config.eager_load                                = true
  config.force_ssl                                 = true
  config.i18n.fallbacks                            = true

  config.log_formatter                             = ::Logger::Formatter.new
  config.log_level                                 = :info
  config.log_tags                                  = %i[request_id]

  config.public_file_server.enabled                = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.webpacker.check_yarn_integrity            = false

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    logger                                         = ActiveSupport::Logger.new(STDOUT)
    logger.formatter                               = config.log_formatter

    config.logger                                  = ActiveSupport::TaggedLogging.new(logger)
  end
end
