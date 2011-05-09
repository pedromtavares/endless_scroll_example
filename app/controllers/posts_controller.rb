class PostsController < ApplicationController
	respond_to :html, :js
	def index
		last = params[:last].blank? ? Time.now + 1.second : Time.parse(params[:last])
		@posts = Post.feed(last)
	end
	
	def create
		@post = Post.new(params[:post])
			if @post.save
				flash[:notice] = "Post successfully created!"
			else
				flash[:error] = "Error! You left some stuff blank."
			end
			redirect_to posts_path
	end
end