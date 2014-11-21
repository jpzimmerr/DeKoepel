class ReservationsController < ApplicationController
	def new 
		@reservation = Reservation.new
		@reservation.build_customer
		@reservation.customer.build_company
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
	@reservations = Reservation.order(params[:sort])

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
			params.require(:reservation).permit(:date,
												 :start,
												 :end,
												 :description,
												 customer_attributes: [ :first_name,
												 					  	:last_name,
												 					  	:phone,
												 					  	:email,
												 					  	company_attributes: [ :name ] ])
		end

end
