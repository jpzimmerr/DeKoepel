class SitesController < ApplicationController
	def new
		@reservation = Reservation.new
		@reservation.build_customer
		@reservation.customer.build_company
	end

	def contact
		if @contact.save 
			SitesMailer.confirmation_email(@sites).deliver
			SitesMailer.reservation_email(@sites).deliver

			redirect_to sites_path
		else
			redirect_to 'sites/new'
		end
	end

	def show
	end
	
	def zaalverhuur
		@faciliteiten = Product.where("category_id = 0")
		@consumpties = Product.where("Category_id = 1")
  	@pages = Page.all
		
	end
	def arrangementen
	end
	def dekoepel
		@page = Page.last
  	@pages = Page.all
	end
	private
		def site_params
			params.require(:contact).permit( :started_at,
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
