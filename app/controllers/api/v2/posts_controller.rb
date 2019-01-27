module Api
	module V2
		class PostsController < ApplicationController
			def home
				@posts = Post.all
				render json: @posts, each_serializer: PostDetailSerializer
			end
		end
	end
end