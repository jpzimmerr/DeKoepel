class PagesController < ApplicationController
	def index

		@pages = Page.where(:kind => params[:kind]).order('created_at DESC')
		#@pages = Page.where(:kind => "0").order('created_at DESC')
	end
	def new
		@page = Page.new
		@page.title = 'Dit is een titel'
	end
	def show
		@page = Page.find(params[:id])
	end
	def create
		page = Page.new
		page = Page.new(page_params)
		page.save
		redirect_to pages_path
	end
	def edit
		@page = Page.find(params[:id])
	end
	def update
		@page = Page.find(params[:id]) 
		@page.update(page_params)
		redirect_to pages_path
	end
	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		redirect_to pages_path
	end
	private
		def page_params
			params.require(:page).permit(:title,:body,:kind)

		end
end
