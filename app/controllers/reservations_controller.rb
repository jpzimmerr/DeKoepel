class ReservationsController < ApplicationController
	def index

  	@customers = Customer.all
  	@companies = Company.all
	  if params[:search]
	    @reservations = Reservation.search(params[:search]).order("created_at DESC")
	  else
	    @reservations = Reservation.all
	  end
	end
end
