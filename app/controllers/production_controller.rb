class ProductionController < ApplicationController
	#registration 
	def pro
		pro = Production.new(windmill_id: params[:windmill_id], gen0_react: params[:gen0], gen1_react: params[:gen1], gen2_react: params[:gen2], prod_react: params[:prod], gen0_activ: params[:activ0], gen1_activ: params[:activ1], gen2_activ: params[:activ2], prod_activ: params[:pactiv])
		if pro.save
			render json: {message: 'reg success'}
		else
			render json: {message: 'reg faliure'}
		end
	end
	#it returns all the value for given windmillid
	def millid
 	getid = Production.where(windmill_id: params[:windmill_id]).last
if getid.present?
 render json:  [getid.as_json(only: [:gen0_react,:gen1_react,:gen2_react,:prod_react,:gen0_activ, :gen1_activ, :gen2_activ, :prod_activ] )]
else
puts "no"
end
end
end
