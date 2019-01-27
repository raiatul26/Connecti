class FriendshipsController < ApplicationController
  

  

	def create
	  current_user.friends << User.find_by_email(params[:friend_id])

	  if @friendship.save
	    flash[:notice] = "Added friend."
	    redirect_to root_url
	  else
	    flash[:notice] = "Unable to add friend."
	    redirect_to root_url
	  end
	end


end
