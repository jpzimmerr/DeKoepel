class CustomerController < ApplicationController

	def index
		@customers = Customer.all
	end
		
	end

	private 
		def customer_params
			params.require(:customer).permit(:first_name,
											 :last_name,
											 :phone,
											 :email,)
		end
end