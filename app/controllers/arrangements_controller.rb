class ArrangementsController < ApplicationController

	def index
		@arrangements = Page.all
	end

	def edit
		@arrangement = Page.find(params[:id])
	end

end
