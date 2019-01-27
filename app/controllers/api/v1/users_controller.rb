module Api
	module V1
		class UsersController < ApplicationController
			skip_before_action :verify_authenticity_token
			def sign_in
				user = User.find_by(email: params[:email])
				if !user.blank?
					if user.valid_password? params[:password]
						user.set_auth_token
						return render json: user
					end
				end
				data = {
					message: "Invalid Username or Password"
				}
				return render json: data, status: 401
			end

			def sign_out
				
				
			end
		end
	end
end