require 'rubygems'
require 'mqtt'

# Publish example
#MQTT::Client.connect('test.mosquitto.org') do |c|
#end

# Subscribe example
MQTT::Client.connect('192.168.0.103') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('test') do |topic,message|
    puts "#{topic}: #{message}"
   # user = User.new(userid: "ss")
    #user = User.new(username: params[:user])
    #user.password_digest = data[:info][:password]
  # if user.save 
   #   puts "yes"
    # else
     #puts "no"
	#end
    #u = message
    puts "Message recieved on topic: #{message.topic}\n>>> #{message.payload}"
  end
end