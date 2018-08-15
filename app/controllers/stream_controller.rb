class StreamController < ApplicationController
	#register history
	def reg
			reg = Stream.new(stream_params)
		if reg.save
			puts "yes"
		else
			puts "no"
		end
	end


	def update
		#formid = Stream.where(windmillid: params[:windmillid])
      			wd = params[:windmillid]
      			ai = params[:ambi]
      			gp = params[:genonetemp]
      			gn = params[:gentwo]
      			nl = params[:nacel]
      			cn = params[:cntrl]
      			hr = params[:hydr]
      			gr = params[:gear]
      			ws = params[:windspeed]
     			a = Stream.find_by(id: '1')
				a.windmillid = wd 
				a.ambi = ai
				a.genonetemp = gp 
				a.gentwo = gn
				a.nacel = nl
				a.cntrl = cn
				a.hydr = hr
				a.gear = gr
				a.windspeed = ws
			if a.save
				puts "yes"
			else
				puts "no"
			end
    end
    # selected windmill lastdata
    def get
				result = Stream.where(windmillid: params[:windmillid]).last
			if result.present?
				render json: [result.as_json(only: [:ambi,:genonetemp,:gentwo,:nacel,:cntrl,:hydr,:gear,:bear,:windspeed])]
 			else
				render json: [{status: "no"}]
      		end
	end
    def stream_params
	 params.require(:windmillid)
	 params.require(:ambi)
	 params.require(:genonetemp)
	 params.require(:gentwo)
	 params.require(:nacel)
	 params.require(:cntrl)
	 params.require(:hydr)
	 params.require(:gear)
	 params.require(:bear)
	 params.require(:windspeed)
 	 params.permit(:windmillid,:ambi,:genonetemp,:gentwo,:nacel,:cntrl,:hydr,:gear,:bear,:windspeed)
	end	
end
