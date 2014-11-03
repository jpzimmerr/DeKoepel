class KoepelController < ApplicationController
  def index
  	@reservations = Reservation.all
  	@customers = Customer.all
  	@companies = Company.all
  	
  end


end

