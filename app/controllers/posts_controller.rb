class PostsController < ApplicationController
	def index
		@posts = Page.where(:kind => "1").order('created_at DESC')
	end
	def new
		#<%= form_for @post do |f| %>
		@post = Page.new
		#vult het veldje alvast in voor je
		@post.title = 'Dit is een titel'
	end
	def show
		@post = Page.find(params[:id])
	end
	def create
		#nieuwe post maken in Post tabel
		post = Page.new

		##post title in title kolom
		#post.title = params[:post][:title]
		##post body in body kolom
		#post.body = params[:post][:body]

		#alle velden van t formulier worden automatisch opgeslagen in database adhv veld
		#(post_params = een method die is in def post_params gemaakt.)
		post = Page.new(post_params)
		#save
		post.save
		#redirect naar posts pagina
		redirect_to posts_path
	end
	def edit
		@post = Page.find(params[:id])
	end
	def update
		#post ophalen
		@post = Page.find(params[:id]) 
		#post updaten adhv de ingevoerde data
		@post.update(post_params)
		#doorsturen naar blog
		redirect_to posts_path
	end
	def destroy
		@post = Page.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
	private
		def post_params
			#check of het mag, als het mag -> opslaan !
			params.require(:post).permit(:title,:body,:kind)

		end

end
