require 'capybara/rspec'

Capybara.register_driver :selenium do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    # chromeOptions: { args: %w[headless disable-gpu] }
    # uncomment the line above to avoid opening a browser window for
    # integration tests (the downside is that modal events - such as
    # confirmations or alerts - are ignored)
  )

  Capybara::Selenium::Driver.new app, browser: :chrome,
                                      desired_capabilities: capabilities
end

Capybara.javascript_driver = :chrome

Capybara.configure do |config|
  config.default_max_wait_time = 10 # seconds
  config.default_driver        = :selenium
end
