class SitesController < ApplicationController
	def new
		@reservation = Reservation.new
		@reservation.build_customer
		@reservation.customer.build_company
	end
end
