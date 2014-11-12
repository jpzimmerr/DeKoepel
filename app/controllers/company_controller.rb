class CompanyController < ApplicationController

	def index
		@companies = Company.all
	end

	private
		def company_params
			params.require(:company).permit(:name)
		end

end