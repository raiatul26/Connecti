class UsersController < ApplicationController


	def profile

  	@user = User.find(params[:id])
  	
  end


	def upload_avatar
  	@user = User.find(params[:id])
  	if !params[:user].blank?
			@user.image.attach(params[:user][:image])
			# @user.image = params[:user][:image]
	  	@user.save
	  else
	  	# flash.now[:error] = "Please select a file to upload"
	  	flash[:error] = "Please select a file to upload"
	  end

  	redirect_to request.referrer
	end


end
