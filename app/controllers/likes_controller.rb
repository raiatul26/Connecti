class LikesController < ApplicationController

	before_action :authenticate_user!

  def toggle
  	# @like = Like.find_by(user_id: params[:user_id], post_id: params[:post_id])

  	# if @like.blank?
  	# 	@like = Like.create(user_id: current_user.id, post_id: params[:post_id])
  	# else
  	# 	@like.destroy 
  	# end

  	@post = Post.find(params[:post_id])
  	if @post.user_can_like(current_user.id)
  		# @like = Like.create(user_id: current_user.id, post_id: params[:post_id])
      @post.likes.create(user_id: current_user.id)
  	else
  		# Like.find_by(user_id:current_user.id, post_id: params[:post_id]).destroy
      @post.likes.first.destroy
  	end

  	redirect_to root_path

  end

  def togglec

    @comment = Comment.find(params[:comment_id])
    if @comment.user_can_like(current_user.id)
      @comment.likes.create(user_id: current_user.id)
    else
      @comment.likes.first.destroy
    end
    
    redirect_to root_path
  end

end

