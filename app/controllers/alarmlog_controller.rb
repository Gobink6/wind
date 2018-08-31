class AlarmlogController < ApplicationController

	def reg
			reg = Alarmlog.new(alarmlog_params)
		if reg.save
			puts "yes"
		else
			puts "no"
		end
	end
    def check
    	wi = params[:windmillid]
    	ts = params[:timestamp]
    	al = params[:alarmlog]
    	re = Alarmlog.last	
    	result = Alarmlog.where(windmillid: params[:windmillid], timestamp: params[:timestamp], alarmlog: params[:alarmlog]).last
    end 
    def alarmlog_params
	 	params.require(:windmillid)
		#params.require(:timestamp)
	 	params.require(:alarmlog)
	 	params.permit(:windmillid,:alarmlog)
	end	

	def get

      get = Alarmlog.where(windmillid: params[:windmillid]).last(3).reverse
      if get.present?
      	
      	 render json:   get.as_json(only: [ :alarmlog, :created_at])
       else
		render json: [{status: "no"}]
      end

	end
def demo

   puts word = params[:save]
  puts  name = word.split(' : ')

end
end
