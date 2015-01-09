class ProductsController < ApplicationController
	def index
		@products = Product.all
		if params[:search]
			@products = @products.search(params[:search])
		end
	end
	def new
		@product = Product.new
	end
	def create
		product = Product.new
		product = Product.new(product_params)
		product.save
		redirect_to products_path
	end
	def edit
		@product = Product.find(params[:id])
	end
	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		redirect_to products_path
	end
	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path
	end
	private
		def product_params
			params.require(:product).permit(:name,:price,:per)
		end
end
