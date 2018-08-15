class StatusController < ApplicationController
	#registration ones
	def reg
			status = Status.new(hourse_params)
    #(no: params[:no], user: params[:user])
      	if status.save
      	 	render json: [{message: 'Add'}]
      	else
      		render json: [{message: 'no'}]
      	end
    end
    #live update
    def update
      		wd = params[:windmillid]
      		st = params[:status]
      		pw = params[:power]
      		gn = params[:gen]
      		wd = params[:wind]
      		fq = params[:frequency]
      		rt = params[:rotor]
      		pt = params[:pitch]
      	a = Status.find_by(windmillid: params[:windmillid])
      	b = Windmill.find_by(no: params[:windmillid])
      		b.location = st
      		if b.save

      	

     		a.windmillid = wd 
			a.status = st
			a.power = pw
			a.gen = gn
			a.wind = wd
			a.frequency = fq
			a.rotor = rt
			a.pitch = pt
		if a.save
			puts "yes"
		else
			puts "no"
		end
	else
		puts "no"
	end
    end
    #get status of live data 
    def get
			 result = Status.find_by(windmillid: params[:windmillid]) 
 			render json: [result.as_json(only: [:status,:power,:gen,:frequency,:rotor,:wind,:pitch])]
	end

    def hourse_params
	 		params.require(:windmillid)
			params.require(:status)
	 		params.require(:power)
	 		params.require(:gen)
	 		params.require(:frequency)
	 		params.require(:rotor)
	 		params.require(:wind)
	 		params.require(:pitch)
 	 		params.permit(:windmillid,:status,:power,:gen,:frequency,:rotor,:wind,:pitch)
	end
end
