class ReservationMailer < ActionMailer::Base
  default from: "from@example.com"

  def confirmation_email(name)
  	@reservation.customer.last_name = name
  	mail(to: @reservation.customer.email, subject: 'Bevestiging van uw reservering')
  end
end
