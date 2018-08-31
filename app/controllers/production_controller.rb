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


def trip

def trip
		
		trip = Production.where(windmill_id: params[:windmillid])
		
		if trip.present?
		start_date = params[:startdate]
		end_date = params[:enddate]
		selected_date = Date.parse(params[:startdate])
		selected_end_date = Date.parse(params[:enddate])
		# This will look for records on the given date between 00:00:00 and 23:59:59
		s_d = Production.where(:created_at => selected_date.beginning_of_day..selected_date.end_of_day)
		puts st_date =  s_d.pluck(:gen0_react, :gen1_react, :gen2_react, :prod_react, :gen0_activ, :gen1_activ, :gen2_activ, :prod_activ).first 
         
		e_d = Production.where(:created_at => selected_end_date.beginning_of_day..selected_end_date.end_of_day)
		 en_date =  e_d.pluck(:gen0_react, :gen1_react, :gen2_react, :prod_react, :gen0_activ, :gen1_activ, :gen2_activ, :prod_activ).last 
		if s_d.present? && e_d.present?

		#puts en_date[0]
		#puts st_date[0]
		puts selected_end_date = Date.parse(params[:startdate])
		puts gen0_react =  en_date[0].to_f - st_date[0].to_f 
		gen1_react = st_date[1].to_f - en_date[1].to_f
		gen2_react = st_date[2].to_f - en_date[2].to_f
		prod_react = st_date[3].to_f - en_date[3].to_f
		gen0_activ = st_date[4].to_f - en_date[4].to_f
		gen1_activ = st_date[5].to_f - en_date[5].to_f
		gen2_activ = st_date[6].to_f - en_date[6].to_f
		prod_activ = st_date[7].to_f - en_date[7].to_f
		
		render json: [{gen0_react: gen0_react, gen1_react: gen1_react, gen2_react: gen2_react, prod_react: prod_react, gen0_activ: gen0_activ, gen1_activ: gen1_activ, gen2_activ: gen2_activ, prod_activ: prod_activ}]
		else
			render json: [{message: "Date not avaiable"}]
		end
		else
			render json: [{message: "no"}]
		end




	end


end

end
