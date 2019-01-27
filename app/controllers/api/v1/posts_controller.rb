module Api
	module V1
		class PostsController < ApplicationController
			skip_before_action :verify_authenticity_token
			before_action :set_api_current_user, only: [:create]

			def home
				@posts = Post.all
				render json: @posts
			end


			def create
				
				new_post = Post.create(post_params)

				new_post.user = @api_current_user
				new_post.save
				return render json: new_post
			end

			private

			def post_params
				params.require(:post).permit(:content, )
				# Error : param is missing or the value is empty: post
				# Solution : params.permit(:content, ) but WHY?
			end
		end
	end
end