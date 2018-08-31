class WindmillController < ApplicationController
	#1.	Insert a Wind Mill
def reg
		 user = Windmill.new(no: params[:no], windformid: params[:id], name: params[:name], latitude: params[:latitude ],londitude: params[:londitude],status_one: params[:status],customer_name: params[:customer_name],sf_no: params[:sf_no],htfc_no: params[:htfc_no],village: params[:village])
    if user.save 
      render json: {massage: 'Windmill added'}
     else
      render json: {massage: 'no Windmill added'}
	end
end
#2.	Get all windmill id for a given  wind Form.
def getmill
	formid = Windmill.where(windformid: params[:id])
	if formid.present?
        render json: formid.as_json(only:[:no])
	else
		render json: {massage: 'Windform not found'}
	end
end
#3.	Get a location for a given wind mill id
 def getlocation
 	locafid =  Windmill.where(no: params[:no])
if locafid.present?
 		locafid =  Windmill.find_by(no: params[:no])
 		render json: [locafid.as_json(only: [:no, :latitude, :londitude,:location])]
else
 		render json: {massage: 'windmill not found'}
 end
end
#4.	Get a wind form for a given wind mill id
def getform
	getform = Windmill.where(no: params[:no])
	if getform.present?
     render json: getform.as_json(only: [:windformid])
	else
		render json: {massage: 'No windfrom available in this id'}
	end
end
#it displays all the value for the given no
def form
	form = Windmill.all
	#form = Windmill.where(windformid: params[:id])
	#if form.present?
     render json: form.as_json(only: [:no])
	#else
		#render json: {massage: 'No windfrom available in this id'}
	#
 #end
end
def getlatlong
	form = Windmill.all
	render json: form.as_json(only: [:no, :latitude, :londitude,:location])
	end

def info
	form = Windmill.where(no: params[:no]).first
	if form.present?
	render json: [form.as_json(only: [:customer_name, :sf_no, :htfc_no,:village])]	
	else
render json: [{message: 'not windform found'}]

	end


end
end