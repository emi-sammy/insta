Rails.application.configure do
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


config.action_mailer.default_url_options = { host: 'pacific-ocean-90426' }
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: "heroku.com",
    address: "smtp.SendGrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
