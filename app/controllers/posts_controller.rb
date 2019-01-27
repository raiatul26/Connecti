class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :destroy]
	before_action :set_post, only: [:destroy]
	before_action :authorize_user, only: [:destroy]

  def home
  	@post = Post.new
  	@posts = Post.all
    @comment = Comment.new
    @comments = Comment.all
    @all_users = User.all.order("id").pluck(:email)
    @user_ids = User.all.order("id").pluck(:id)

    respond_to do |format|
      format.html
      format.json {
        if params[:details] == "true"
          render json: @posts, each_serializer: PostDetailSerializer
        else
          render json: @posts
        end
      }
    end
  end

  def create
    @comment = Comment.new
  	@post = Post.create(content: params[:post][:content], user_id: current_user.id)
  	# sredirect_to action: "home"
  end

  def destroy
    @post_id = @post.id;
  	@post.destroy
  	# redirect_to action: "home"
  end

  private

  def set_post
  	@post = Post.find(params[:id])
  end

  def authorize_user
  	if (@post.user_id != current_user.id)
  		redirect_to action: "home"
  	end 
  end

end
