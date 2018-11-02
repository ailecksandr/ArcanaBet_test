# frozen_string_literal: true

default_max_wait_time = 3
default_width         = 1280
default_height        = 720
max_screenshots_count = 20
selenium_flags        = %W[
  --headless
  --disable-gpu
  --window-size=#{default_width},#{default_height}
]

options = Selenium::WebDriver::Chrome::Options.new
selenium_flags.each { |flag| options.add_argument(flag) }

Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.configure do |config|
  config.default_max_wait_time = default_max_wait_time
  config.default_driver        = :headless_chrome
  config.javascript_driver     = :headless_chrome
end

Capybara::Screenshot.autosave_on_failure = false
Capybara::Screenshot.prune_strategy      = { keep: max_screenshots_count }

default_protocol  = 'http'
default_subdomain = 'leobit'
default_host      = 'lvh.me'

Capybara.app_host = "#{default_protocol}://#{default_subdomain}.#{default_host}"
Capybara.configure { |config| config.always_include_port = true }

RSpec.configure do |config|
  config.after(:each, type: :feature) do |spec|
    next if spec.exception.blank?

    screenshot_path = "#{Time.now.strftime('%Y-%m-%d-%H:%M')}-#{spec.location.split('/').last}"

    save_page("#{screenshot_path}.html")
    page.save_screenshot("#{screenshot_path}.png", full: true)

    Capybara::Screenshot.prune
  end
end
