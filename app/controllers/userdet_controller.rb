class UserdetController < ApplicationController
	#1.	Insert a wind mill id and User id
	def reg
		regis = Userdet.new(usid: params[:userid], windmill: params[:millid])
		if regis.save
			render json: [{message: 'reg success'}]
		else
			render json: [{message: 'something error'}]
		end
	end
	#2.	Get all windmill_id for a given user.
	def getmill
	
 	formid = Userdet.where(usid: params[:userid]).all
 	
if formid.present?
		
 render json:  formid.as_json(only: [:windmill])
else
render json:  [{message: 'not found'}]
end
end
#3.	Get a user for a given windmill _id
def getuser
 	formid = Userdet.where(windmill: params[:millid])
if formid.present?

 render json:  formid.as_json(only: [:usid])
else
puts "no"
end
end
def test

x = 2

while x >= 2
  

# request = HTTParty.post('http://fcm.googleapis.com/fcm/send', :body => { "to" => "/topics/USER",  "data" = {"extra_information" => extra_information}, "notification" => { "title" =>title,"text"=>,'text'}}.to_json, :headers => { 'Content-Type' => 'application/json', 'Authorization' => "key=#{AAAAKGJAyhQ:APA91bHuhrD4CG6jB6_64l94Yd5NOPTOuttrHL0FCKwvZMAzkppI6eEQD7Txa4JB56EYHQtIEEzbObxXMBbyCcVFsWoNjLUuXZUuU4lXw1EdffMWJYJnE8ysFVV2NNMT3s3l2wUPN8NMQTkNQxlaJzTbeBXZGO_AVg}" } )
                    


require 'uri'
require 'net/http'

url = URI("http://fcm.googleapis.com/fcm/send")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["content-type"] = 'application/json'
request["authorization"] = 'key=AAAAKGJAyhQ:APA91bHuhrD4CG6jB6_64l94Yd5NOPTOuttrHL0FCKwvZMAzkppI6eEQD7Txa4JB56EYHQtIEEzbObxXMBbyCcVFsWoNjLUuXZUuU4lXw1EdffMWJYJnE8ysFVV2NNMT3s3l2wUPN8NMQTkNQxlaJzTbeBXZGO_AVg'
request["cache-control"] = 'no-cache'
request.body = "{\r\n  \"to\": \r\n    \"/topics/USER\"\r\n  ,\r\n  \"data\": {\r\n    \"extra_information\": \"This is some extra information\"\r\n  },\r\n  \"notification\": {\r\n    \"title\": \"New York Weather Update!\",\r\n    \"text\": \"This is the notification message.\",\r\n  }\r\n}"

response = http.request(request)
puts response.read_body
#url = server + "/v1/entities"
#request.set_content_type("application/json")
#request.set_authorization("key=AAAAKGJAyhQ:APA91bHuhrD4CG6jB6_64l94Yd5NOPTOuttrHL0FCKwvZMAzkppI6eEQD7Txa4JB56EYHQtIEEzbObxXMBbyCcVFsWoNjLUuXZUuU4lXw1EdffMWJYJnE8ysFVV2NNMT3s3l2wUPN8NMQTkNQxlaJzTbeBXZGO_AVg")

# Send request
#response = http.request(request)


  x -=  1
end

puts "Done!"

	end
	def register

		mobile =  params[:userid]
		windid = params[:millid]
		#spilt mills
		mill = windid.chomp
		name = mill.split(' ')
		#find length
		leng = name.length
			n = 0
			for i in 1..leng do 
				mill_id = name[n]
				puts leng
				puts mill_id
				regis = Userdet.new(usid: params[:userid], windmill: mill_id)
				if regis.save
					puts"yes"
				else
					puts"No"
				end


				n +=1
				
				puts leng
			end
	end 
	def logout
		
			userid = Userdet.where(usid: params[:phone]).all
			
			if userid.present?
				bluk_token = userid.pluck(:windmill)
			phone_leg = bluk_token.length
			n = 0
			 for i in 1..phone_leg do 
			 	single_token = bluk_token[n]
				b = userid.find_by(windmill: single_token)
				b.mobile_token = ""
				 b.save
				 n +=1
			 end
					render json: [{message: 'suc'}]
			else
				render json: [{message: 'error'}]
			end
			
         end
end
