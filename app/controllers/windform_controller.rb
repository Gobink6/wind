class WindformController < ApplicationController
	#2.	Get all wind form
	def index
		@datadb = Windform.all
 render json:   @datadb.as_json(only: [:user])
		
	end
	#not in use

	def ind
		datadb = Windform.where(user: params[:user], no: params[:no])
 if datadb.exists?
     render json:  [{message: 'already exists'}]
     else
      render json:  datadb.as_json(only: [:user])
	end
	end

	#3.	Delete a wind form
	def delete
		del = Windform.where(no: params[:no])
		if del.present?
			delfin = Windform.find_by(no: params[:no])
			delfin.destroy
			render json: {message: 'delete successful'}
		else
			render json: {message: 'something error'}
		end
	end
	#1.	Insert new Wind form
def register
		 
      windform = Windform.new(wind_params)
		#(no: params[:no], user: params[:user])
      if windform.save
      	 render json: [{message: 'Add'}]
      	else
      		 render json: [{message: 'exists'}]
      	
	end
end

def wind_params
	 params.require(:user)
	 params.permit(:user)
	 #params.require(:no).permit(:no)
end
end

