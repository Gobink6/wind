class LogController < ApplicationController
	#log registration process
	def row
		row = Log.new(windmill_id: params[:id], log: params[:log], alaram_log: params[:alog])
		if row.save
			render json: {message: 'reg success'}
		else
			render json: {message: 'something error'}
		end
	end
	#it returns all the value for given id
	def rj
 	login = Log.where(windmill_id: params[:id])
if login.present?
 render json:  login.as_json( only: [:log, :alaram_log] )
else
puts "no"
end
end
end
