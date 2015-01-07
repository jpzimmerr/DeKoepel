class ArrangementsController < ApplicationController

	def index
		@arrangements = Page.where(:kind => "2").order('created_at DESC')
	end

	def edit
		@arrangement = Page.find(params[:id])
	end

	def new
		@arrangement = Page.new
		@arrangement.title = 'Dit is een titel'
	end

	def create
		arrangement = Page.new
		arrangement = Page.new(arrangement_params)
		arrangement.save
		redirect_to arrangements_path
	end

	private
		def arrangement_params
			params.require(:arrangement).permit(:title,:body,:kind)	
		end

end
