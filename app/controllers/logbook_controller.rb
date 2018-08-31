		class LogbookController < ApplicationController

	def reg
			reg = Logbook.new(log_params)
		if reg.save
			puts "yes"
		else
			puts "no"
		end
	end

    def log_params
	 	params.require(:windmillid)
		#params.require(:timestamp)
	 	params.require(:logbook)
	 	#params.require(:alaram_log)
	 	params.permit(:windmillid,:logbook)
	end	

	def get

      get = Logbook.where(windmillid: params[:windmillid]).last(10).reverse
      if get.present?
      	s = get.pluck(:created_at)
      	y = s[0].strftime("%d-%m-%Y %H:%M:%S")
      	puts y 
      	 render json:   get.as_json(only: [:logbook,  :created_at])
       else
		render json: [{status: "no"}]
      end

	end

end
