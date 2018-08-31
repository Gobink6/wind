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

    	datadb = Status.where(windmillid: params[:windmillid])
    	if datadb.present?
      		wdid = params[:windmillid]
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
      	    b.save
      	    if st == "Stop"
      	    	@sat = st
      	    	@w = wdid
      	    
      	    	userid = Userdet.where(windmill: params[:windmillid]).all
      	    	  		 bluck_token = userid.pluck(:mobile_token)
      	    	  		 bluck_Action = userid.pluck(:action)
      	    	  		 actions = 0 
      	    	  		 single_action = bluck_Action[actions]
						 bluck_id_leg = bluck_token.length
      	    	 		 n= 0
      	    	 			for i in 1..bluck_id_leg do 
								if single_action.nil? || single_action == true

									@single_token = bluck_token[n]
									actiontrue = userid.find_by(mobile_token: @single_token)
									actiontrue.action = "0"
									actiontrue.save

												require 'uri'
												require 'net/http'
						      					url = URI("http://fcm.googleapis.com/fcm/send")

												http = Net::HTTP.new(url.host, url.port)

												request = Net::HTTP::Post.new(url)
												request["content-type"] = 'application/json'
												request["authorization"] = 'key=AAAAfm5FEyE:APA91bHcMrmcAKIWpLcONC1PWl0CiOq7_ZfijrUi18pLV8vQBuWtaIe1ruQq_ZfDf3acc59u5yLT2tVDqikmk4UQZtUiCgr3c76sEOs3ONeIVUXaBev1IFiWYRVhCR1bH3Sfxj8TOZU5axhER-ylmcYD5qj7vJm13A'
												request["cache-control"] = 'no-cache'
												request.body = "{\r\n  \"to\": \r\n    \"#{@single_token}\"\r\n  ,\r\n  \"data\": {\r\n    \"extra_information\": \"windmill\"\r\n  },\r\n  \"notification\": {\r\n    \"title\": \"Our windmill Stop!\",\r\n    \"text\": \"#{@w}\",\r\n  }\r\n}"

												response = http.request(request)
												puts response.read_body   
												
						                                 
						                                  n +=1
						                                  actions +=1
                                  else
						
									actions +=1
      	    	 		 		  end
                             end

                            
      	 else 
                 @sat = st   
				@w = wdid
      	    
      	    	userid = Userdet.where(windmill: params[:windmillid]).all
      	    	  		 bluck_token = userid.pluck(:mobile_token)
      	    	  		 bluck_Action = userid.pluck(:action)
      	    	  		 actions = 0 
      	    	  		 single_action = bluck_Action[actions]
						 bluck_id_leg = bluck_token.length
      	    	 		 n= 0
      	    	 			for i in 1..bluck_id_leg do 
								if single_action == false

									@single_token = bluck_token[n]
									actiontrue = userid.find_by(mobile_token: @single_token)
									actiontrue.action = "1"
									actiontrue.save

												require 'uri'
												require 'net/http'
						      					url = URI("http://fcm.googleapis.com/fcm/send")

												http = Net::HTTP.new(url.host, url.port)

												request = Net::HTTP::Post.new(url)
												request["content-type"] = 'application/json'
												request["authorization"] = 'key=AAAAfm5FEyE:APA91bHcMrmcAKIWpLcONC1PWl0CiOq7_ZfijrUi18pLV8vQBuWtaIe1ruQq_ZfDf3acc59u5yLT2tVDqikmk4UQZtUiCgr3c76sEOs3ONeIVUXaBev1IFiWYRVhCR1bH3Sfxj8TOZU5axhER-ylmcYD5qj7vJm13A'
												request["cache-control"] = 'no-cache'
												request.body = "{\r\n  \"to\": \r\n    \"#{@single_token}\"\r\n  ,\r\n  \"data\": {\r\n    \"extra_information\": \"windmill\"\r\n  },\r\n  \"notification\": {\r\n    \"title\": \"OurWind#{@sat}\",\r\n    \"text\": \"#{@w}\",\r\n  }\r\n}"

												response = http.request(request)
												puts response.read_body   
												
						                                 
						                                  n +=1
						                                  actions +=1
                                  else
						
									actions +=1
      	    	 		 		  end
                             end

		 end
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
						  reg = Status.new(hourse_params)
						if reg.save
				      	 	render json: [{message: 'Add'}]
				      	else
				      		 render json: [{message: 'no'}]
				      	end
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
