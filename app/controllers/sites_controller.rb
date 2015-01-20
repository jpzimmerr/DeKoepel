class SitesController < ApplicationController
	def new
		@reservation = Reservation.new
		@reservation.build_customer
		@reservation.customer.build_company
	end

	def create
		@reservation = Reservation.new(reservation_params)

		if @reservation.save 
			SitesMailer.confirmation_email(@reservation).deliver
			SitesMailer.reservation_email(@reservation).deliver

			redirect_to sites_path
		else
			redirect_to 'sites/new'
		end
	end

	def show
	end

	private
		def reservation_params
			params.require(:reservation).permit( :started_at,
												 :ended_at,
												 :amount,
												 :description,
												 :note,
												 customer_attributes: [ :first_name,
												 					  	:last_name,
												 					  	:phone,
												 					  	:email,
												 					  	:address,
												 					  	:zip,
												 					  	:city,
												 					  	company_attributes: [ :name ] ])
		end
end
