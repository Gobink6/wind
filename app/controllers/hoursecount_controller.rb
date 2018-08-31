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
	def trip
		
		trip = Hoursecount.where(windmillid: params[:windmillid])
		
		if trip.present?
		start_date = params[:startdate]
		end_date = params[:enddate]
		selected_date = Date.parse(params[:startdate])
		selected_end_date = Date.parse(params[:enddate])
		# This will look for records on the given date between 00:00:00 and 23:59:59
		s_d = Hoursecount.where(:created_at => selected_date.beginning_of_day..selected_date.end_of_day)
		puts st_date =  s_d.pluck(:total, :lineok, :turbineok, :run, :genone, :gentwo, :ambient, :line, :yawing, :service, :disp).first 
        
		e_d = Hoursecount.where(:created_at => selected_end_date.beginning_of_day..selected_end_date.end_of_day)
		 en_date =  e_d.pluck(:total, :lineok, :turbineok, :run, :genone, :gentwo, :ambient, :line, :yawing, :service, :disp).last 
		 if s_d.present? && e_d.present?
		#puts en_date[0]
		#puts st_date[0]
		puts selected_end_date = Date.parse(params[:startdate])
		puts total =  en_date[0].to_f - st_date[0].to_f 
		lineok = st_date[1].to_f - en_date[1].to_f
		turbineok = st_date[2].to_f - en_date[2].to_f
		run = st_date[3].to_f - en_date[3].to_f
		genone = st_date[4].to_f - en_date[4].to_f
		gentwo = st_date[5].to_f - en_date[5].to_f
		ambient = st_date[6].to_f - en_date[6].to_f
		line = st_date[7].to_f - en_date[7].to_f
		yawing = st_date[8].to_f - en_date[8].to_f
		service = st_date[9].to_f - en_date[9].to_f
		 disp = st_date[10].to_f - en_date[10].to_f
		render json: [{total: total, lineok: lineok, turbineok: turbineok, run: run, genone: genone, gentwo: gentwo, ambient: ambient, line: line, yawing: yawing, service: service, disp: disp}]
		else
			render json: [{message: "Date not avaiable"}]
		end
		else
			render json: [{message: "no"}]
		end




	end
end