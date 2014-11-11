class ReservationsController < ApplicationController
	def new
		@reservation = Reservation.new
		@reservation.build_customer
	end


	def create
		@reservation = Reservation.new(reservation_params)

		if @reservation.save
			redirect_to reservations_path
		else
			render 'new'
		end
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def index
		@reservations = Reservation.all
		@customers = Customer.all
		@companies = Company.all
	end

	def edit 
		@reservation = Reservation.find(params[:id])
	end

	def update 
		@reservation = Reservation.find(params[:id])

		if @reservation.update(reservation_params)
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

	private
		def reservation_params
			params.require(:reservation).permit(:first_name,
												:last_name,
												:phone,
												:email,
												:company_name,
												:date,
												:start,
												:end,
												:description)
		end

end
