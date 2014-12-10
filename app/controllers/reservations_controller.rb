class ReservationsController < ApplicationController
	

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
	
	@reservations = Reservation.all	
  	@customers = Customer.all
  	@companies = Company.all


	@reservations = Reservation.paginate(:page => params[:page])

	  if params[:search]
		@reservations = @reservations.search(params[:search])
	  end

	  if params[:month_search]
	  	@reservation = @reservations.search(params[:search])
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
