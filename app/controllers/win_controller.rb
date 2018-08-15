class WinController < ApplicationController
	def register
		 user = Win.new(user: params[:user], pass: params[:pass])
    #user = User.new(username: params[:user])
    #user.password_digest = data[:info][:password]
   
   if user.save 
      render json: {massage: 'Register successful'}
     else
      render json: {massage: 'Register unsuccessfull'}
	end
end
end
