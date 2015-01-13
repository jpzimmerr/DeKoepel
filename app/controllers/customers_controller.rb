class CustomersController < ApplicationController
	def index
		@reservations = Reservation.all
		@customers = Customer.paginate(:page => params[:page])
		@companies = Company.all

		@customers.per_page = 10

		if params[:search]
			@customers = @customers.search(params[:search])
		end
	end
  	def show
		@customer = Customer.find(params[:id])
		@reservations_count = @customer.reservations.size
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update 
		@customer = Customer.find(params[:id])

		if @customer.update(customer_params)
			redirect_to @customer
		else
			render 'edit'
		end
	end

	def destroy
		@customer = Customer.find(params[:id])
		@customer.destroy

		redirect_to customers_path
	end
	private
		def customer_params
			params.require(:customer).permit( :first_name,
												 :last_name,
												 :address,
												 :phone,
												 :email,
												 :zip,
												 :city,
												 company_attributes: [ :name ])
		end

end
