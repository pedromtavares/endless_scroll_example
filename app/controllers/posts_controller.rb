class PostsController < ApplicationController
	respond_to :html, :js
	def index
		last = params[:last].blank? ? Time.now + 1.second : Time.parse(params[:last])
		@posts = Post.feed(last)
	end
	
	def create
		@post = Post.new(params[:post])
			if @post.save
				redirect_to posts_path, :notice => "Post successfully created!"
			else
				redirect_to posts_path, :error => "Problem creating your post."
			end
	end
end