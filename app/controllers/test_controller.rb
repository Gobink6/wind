class TestController < ApplicationController
def regis
		 #user = Test.new(no: params[:no], name: params[:name])
    params.require(:Test).permit(:no, :name)
   # params[:no], params[:name]
    #user = User.new(username: params[:user])
    #user.password_digest = data[:info][:password]
   
  # if user.save 
    #  render json: {massage: 'Register successful'}
    # else
    #  render json: {massage: 'Register unsuccessfull'}
	#end
end

def destroy
	object = Test.new(regis)
	
	 if object.save 
     render json: {massage: 'Register successful'}
    else
     render json: {massage: 'Register unsuccessfull'}
	end
 #nu = params[:no]
 #no = params[:name]
 #user = Test.find( params[:id])
  # user = Test.update(no: params[:no], name: params[:name])
# data = Test.where(name: params[:name], no: params[:no])
 nu = params[:no], params[:name]
#na = params[:name]		
#if data.present?
	user=Test.find_by(id: '5')
    #user.all = nu
    #user.name = na
    #user.save
   #user.save
  
     end
end