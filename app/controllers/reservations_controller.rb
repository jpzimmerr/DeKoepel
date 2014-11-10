class ReservationsController < ApplicationController
	def index

  	@customers = Customer.all
  	@companies = Company.all
	  if params[:search]
	    @reservations = Reservation.search(params[:search])
	  else
	    @reservations = Reservation.all
	  end
	end
end
