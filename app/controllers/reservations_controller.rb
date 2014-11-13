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

	def show
		@reservation = Reservation.find(params[:id])
	end

	def edit
		@reservation = Reservation.find(params[:id])
	end

	def update 
		@reservation = Reservation.find(params[:id])

		if @reservation.update(params[:id])
			redirect_to @reservation
		else
			render 'edit'
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy

		redirect_to reservations_path
	end
end
