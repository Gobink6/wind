class UserController < ApplicationController
def users
		 user = User.new(userid: params[:id], windmillid: params[:windmillid])
    #user = User.new(username: params[:user])
    #user.password_digest = data[:info][:password]
   
   if user.save 
      render json: {massage: 'Register successful'}
     else
      render json: {massage: 'Register unsuccessfull'}
	end
end
