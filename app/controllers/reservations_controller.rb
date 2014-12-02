class ReservationsController < ApplicationController
	

	def new 
		@reservation = Reservation.new
		@reservation.build_customer
		@reservation.customer.build_company
		@reservation.status = 1
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
	@reservations = Reservation.all	
  	@customers = Customer.all
  	@companies = Company.all

  	@filterrific = Filterrific.new(Reservation, params[:filterrific])
  	@reservations = Reservation.filterrific_find(@filterrific).page(params[:page])

	@reservations = Reservation.paginate(:page => params[:page])

	  if params[:search]
		@reservations = @reservations.search(params[:search])
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
												 :amount,
												 :description,
												 customer_attributes: [ :first_name,
												 					  	:last_name,
												 					  	:phone,
												 					  	:email,
												 					  	company_attributes: [ :name ] ])
		end
end
