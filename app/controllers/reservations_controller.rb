class ReservationsController < ApplicationController
	#http_basic_authenticate_with name: "Administrator", password: "Welkom12"

	def new 
		@reservation = Reservation.new
		@reservation.build_customer
		@reservation.customer.build_company
		@reservation.status = 1
		@reservation.amount = 0
	end

	def create
		@reservation = Reservation.new(reservation_params)

		if @reservation.save
			redirect_to reservations_path
		else
			render 'new'
		end
	end

	def index
		@reservations = Reservation.includes(customer: :company).paginate(:page => params[:page])

		if params[:search]
			@reservations = @reservations.search(params[:search])
		end

	 	if params[:year] && params[:month]
	 		@reservations.per_page = 256
	 		start_date = Date.new(params[:year].to_i, params[:month].to_i).beginning_of_month
	 		end_date = start_date.end_of_month
	  		@reservations = @reservations.where("started_at >= ? AND started_at <= ?", start_date, end_date)
	  	else
	  		@reservations.per_page = 10
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
			params.require(:reservation).permit( :started_at,
												 :ended_at,
												 :amount,
												 :description,
												 :note,
												 :location,
												 :customer_id,
												 customer_attributes: [ :id,
												 						:first_name,
												 					  	:last_name,
												 					  	:phone,
												 					  	:email,
												 					  	:address,
												 					  	:zip,
												 					  	:city,
												 					  	company_attributes: [ :name ] ])
		end
end
