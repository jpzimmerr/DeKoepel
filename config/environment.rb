# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#shoot out a mail
ActionMailer::Base.smtp_settings = {
	:user_name => 'jelmer.timmer@gmail.com',
	:password => '[G!XkA/pn9HtyQ\,',
	:domain => 'gmail.com',
	:address => 'smtp.gmail.com',
	:port => '587',
	:authentication => 'plain',
	:enabled_starttls_auto => true
}