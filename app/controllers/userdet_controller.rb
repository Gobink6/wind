class UserdetController < ApplicationController
	#1.	Insert a wind mill id and User id
	def reg
		regis = Userdet.new(usid: params[:userid], windmill: params[:millid])
		if regis.save
			render json: [{message: 'reg success'}]
		else
			render json: [{message: 'something error'}]
		end
	end
	#2.	Get all windmill_id for a given user.
	def getmill
 	formid = Userdet.where(usid: params[:userid])
if formid.present?
 render json:  formid.as_json(only: [:windmill])
else
render json:  [{message: 'not found'}]
end
end
#3.	Get a user for a given windmill _id
def getuser
 	formid = Userdet.where(windmill: params[:millid])
if formid.present?
 render json:  formid.as_json(only: [:usid])
else
puts "no"
end
end

end
