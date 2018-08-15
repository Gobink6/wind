class ElectricalController < ApplicationController
	#1.	Insert a data
 	def reg
  	  reg = Electrical.new(electrical_params)
		if reg.save
      	 	render json: [{message: 'Add'}]
      	else
      		 render json: [{message: 'no'}]
      	end
   end
   #update livedata
    def update
    	datadb = Electrical.where(windmillid: params[:windmillid])
 if datadb.present?
 	puts 'present'
      	wd = params[:windmillid]
      	pw = params[:power]
      	ci = params[:cosphi]
      	fq = params[:frequency]
      	l1v = params[:l1v]
      	l2v = params[:l2v]
      	l3v = params[:l3v]
      	l1a = params[:l1a]
      	l2a = params[:l2a]
      	l3a = params[:l3a]
    a = Electrical.find_by(windmillid: params[:windmillid]) 
		a.windmillid = wd 
		a.power = pw
		a.cosphi = ci
		a.frequency = fq
		a.l1v = l1v
		a.l2v = l2v
		a.l3v = l3v
		a.l1a = l1a
		a.l2a = l2a
		a.l3a = l3a
		if a.save
			puts "yes"
		else
			puts "no"
		end
	else
		  reg = Electrical.new(electrical_params)
		if reg.save
      	 	render json: [{message: 'Add'}]
      	else
      		 render json: [{message: 'no'}]
      	end
	end
      end
      #get the windmill lastdata
      def get
      	 result = Electrical.find_by(windmillid: params[:windmillid])
		 render json: [result.as_json(only: [:power,:cosphi,:frequency,:l1v,:l2v,:l3v,:l1a,:l2a,:l3a])]
end
    def electrical_params
	 	params.require(:windmillid)
	 	params.require(:power)
	 	params.require(:cosphi)
	 	params.require(:frequency)
	 	params.require(:l1v)
	 	params.require(:l2v)
	 	params.require(:l3v)
	 	params.require(:l1a)
	 	params.require(:l2a)
	 	params.require(:l3a)
	 	params.permit(:windmillid,:power,:cosphi,:frequency,:l1v,:l2v,:l3v,:l1a,:l2a,:l3a)
	 end
end
