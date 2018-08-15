 class HoursecountController < ApplicationController
	#
	def reg
	  	windform = Hoursecount.new(hourse_params)
      if windform.save
      	render json: [{message: 'Add'}]
      else
      	render json: [{message: 'no'}]
      end
    end

    def pro
      	get = Hoursecount.where(windmillid: params[:windmillid]).last
      if get.present?
      	 render json:   [get.as_json(only: [:timestamp,:total,:lineok,:turbineok,:run,:genone,:gentwo,:ambient,:line,:yawing,:service,:disp])]
       else
		render json: [{status: "no"}]
      end
	end
     
  	def hourse_params
	 	params.require(:windmillid)
		params.require(:timestamp)
		params.require(:total)
	 	params.require(:lineok)
	 	params.require(:turbineok)
	 	params.require(:run)
	 	params.require(:genone)
	 	params.require(:gentwo)
	 	params.require(:ambient)
	 	params.require(:line)
	 	params.require(:yawing)
	 	params.require(:service)
	 	params.require(:disp)
	 	params.permit(:windmillid,:timestamp,:total,:lineok,:turbineok,:run,:genone,:gentwo,:ambient,:line,:yawing,:service,:disp)
	end
end