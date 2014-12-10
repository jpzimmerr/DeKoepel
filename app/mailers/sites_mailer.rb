class SitesMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(reservation)
  	@last_name = reservation.customer.last_name
  	@email = reservation.customer.email
  	@first_name = reservation.customer.first_name
  	@phone = reservation.customer.phone
  	@company = reservation.customer.company.name
  	@date = reservation.date
  	@start = reservation.start
  	@end = reservation.end
  	@description = reservation.description
  	mail(to: @email, subject: 'Bevestiging van uw reservering')
  end
end
