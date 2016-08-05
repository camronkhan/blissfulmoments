# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# SendGrid configuration	https://devcenter.heroku.com/articles/sendgrid#ruby-rails
ActionMailer::Base.smtp_settings = {
	address: 				'smtp.sendgrid.net',
	port: 					'587',
	authentication: 		:plain,
	user_name: 				ENV['SENDGRID_USERNAME'],
	password: 				ENV['SENDGRID_PASSWORD'],
	domain: 				'heroku.com',
	enable_starttls_auto: 	true
}