class ReservationsController < ApplicationController
	def new
		@reservation = Reservation.new
	end

	def create
		@reservation = Reservation.new(reservation_params)

		redirect_to reservations_path
	end

	def index
		@reservations = Reservation.all
	end

	private
		def reservation_params
			params.require(:reservation).permit(:first_name,
												:last_name,
												:phone,
												:email,
												:date,
												:start,
												:end,
												:description)
		end

end
