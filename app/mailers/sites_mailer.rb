class SitesMailer < ActionMailer::Base
  default from: "from@example.com"

  ActionMailer::Base.smtp_settings = {
    :address => "smtp.gmail.com",
    :port => 587,
    :domain => "gmail.com",
    :username => "my@email.com",
    :password => "mypassword",
    :authentication => "plain",
    :enable_starttls_auto => true
  }

  def reservation_email(reservation)
  	@last_name = reservation.customer.last_name
  	@email = reservation.customer.email
  	@first_name = reservation.customer.first_name
  	@phone = reservation.customer.phone
  	@company = reservation.customer.company.name
  	@started_at = reservation.started_at
  	@ended_at = reservation.ended_at
  	@description = reservation.description
  	@created_at = reservation.created_at
  	mail(to: 'from@example.com', subject: 'Er is een nieuwe reservering gemaakt op: <%= @created_at %>'  )
  end

  def confirmation_email(reservation)
  	@last_name = reservation.customer.last_name
  	@email = reservation.customer.email
  	@first_name = reservation.customer.first_name
  	@phone = reservation.customer.phone
  	@company = reservation.customer.company.name
  	@started_at = reservation.started_at
  	@ended_at = reservation.ended_at
  	@description = reservation.description
  	mail(to: @email, subject: 'Bevestiging van uw reservering')
  end
end
