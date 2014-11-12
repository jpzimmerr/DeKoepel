class CustomerController < ApplicationController

	def index
		@customer = Customer.all
	end

	private 
		def customer_params
			params.require(:customer).permit(:first_name,
											 :last_name,
											 :phone,
											 :email,)
		end
end