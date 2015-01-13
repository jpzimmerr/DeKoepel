class PagesController < ApplicationController
	def index

		@pages = Page.where(kind: params[:kind]).order('created_at DESC')
		#@pages = Page.where(:kind => "0").order('created_at DESC')
	end
	def new
		@page = Page.new
	end
	def show
		@page = Page.find(params[:id])
	end
	def create
		page = Page.new
		page = Page.new(page_params)
		page.save
		redirect_to page_path(kind: @page.kind)
	end
	def edit
		@page = Page.find(params[:id])
	end
	def update
		@page = Page.find(params[:id]) 
		@page.update(page_params)
		redirect_to page_path(kind: @page.kind)
	end
	def destroy
		@page = Page.find(params[:id])
		@page.destroy
		redirect_to pages_path(kind: @page.kind)
	end
	private
		def page_params
			params.require(:page).permit(:title,:body,:kind)

		end
end