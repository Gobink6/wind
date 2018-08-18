class RegisterController < ApplicationController
  #1. Validate based on the condition and Insert all the fields 
	def regi
		 user = Register.new(name: params[:name], emailid: params[:email], phone: params[:phone], role: params[:role], windformid: params[:id], password: "xyz" )
    if user.save
    	render json: [{message: 'Register success'}]
    else
    	render json: [{message: 'username already exists'}]
    end
    end
    #2.  Verify password against email id /phone number (it should detect whether it is a phone or mail and validate it)
	def check 
		datadb = Register.where(name: params[:name], password: params[:pass])
 
  if datadb.exists? 
   
                         
                  render json:   datadb.as_json(only: [:role, :phone])
     else
      render json: [{role: "inu"}]
	end
		
	end
  #3.  Get role based on email id /phone number.
	def userexist 
		datadb = Register.where(name: params[:name], emailid: params[:email], password: params[:pass]).first
 
  if datadb.present? 
     render json:   [{message: 'user validate'}]
     else
      render json: [{message: 'user not validate'}]
	end
		
	end
#4.  Update the password for given phone number /email id. ( security need to be considered)
def changepass 
	user = Register.where(name: params[:name], password: params[:pass])
		na = params[:name]
       changepass = params[:changepass]
      if user.present?
      user = Register.find_by(name: na)
	  user.password =  changepass
      user.save
      render json: [{message: 'password successfully change'}]
  else
  	render json: [{message: 'Enter correct password'}]
  end
end
#displays the registered names
def value
  value = Register.all
     render json: value.as_json(only: [:name])
end 
#it displays the role,phone,emailid for the given name 
def detail
  detail = Register.where(name: params[:name])
if detail.present?
 render json: detail.as_json(only: [:emailid, :phone, :role])
else
puts "no"
end
end
end
