class ArrangementsController < ApplicationController

	def index
		@arrangements = Arrangement.all
	end

	def edit
		@arrangement = Arrangement.find(params[:id])
	end

end
