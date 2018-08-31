Rails.application.routes.draw do
  get 'temp/data'
  get 'electrical/data'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#Table 1-register
post '/userregister' => 'register#regi'#userregistration
post '/check' => 'register#check'#it check the name and password and return the role for the given name
post '/userexist' => 'register#userexist'#it check whether user is validate or not
get '/registerdetail' => 'register#value'#displays the registered name
post '/verify' => 'register#detail'#it displays the role,phone,emailid for the given name 


#Table 2
post '/regform' => 'windform#register'#windform register process
get '/getallforms' => 'windform#index'#displays all the user in windform
post '/deleterow' =>'windform#delete'#it delete the all value in that row 
post '/changepass' => 'register#changepass'#change of password

#Table 3
post '/millreg' => 'windmill#reg'#windmill registration process
post '/getmill' =>'windmill#getmill'#it returns the all the windmill  under the given winformid
post '/getlocation' => 'windmill#getlocation'#it returns the latitude and loditude  for the given id
post '/getform' => 'windmill#getform'#it returns windformid for the given id
get '/getwindid' => 'windmill#form'#it displays all the values in the table
get '/getlatlong' => 'windmill#getlatlong'
post '/getmillinfo' => 'windmill#info'

#Table 4
post '/adusinfo' => 'userdet#reg'#user registration process
post '/getinfo' => 'userdet#getmill'#it displays the windmillid 
post '/getusinfo' => 'userdet#getuser'#it displays the userid
get '/call' => 'userdet#test'
post'/aduserinfo' => 'userdet#register'
post '/logout'    => 'userdet#logout'

#Table 5
post '/productionreg' => 'production#pro'#production registration process
post  '/getid' => 'production#millid'#it returns all the value for the given id
post'/trippro' => 'production#trip'

#table sign
post '/sign' => 'log#row'#log registration process
post '/signup' => 'log#rj'#it returns all the value for the given id

#Table 6
post '/hoursereg' => 'hoursecount#reg' #Register
post '/gethourse' => 'hoursecount#pro' #Get Selected windmill data data
post '/trip' => 'hoursecount#trip'

#Table 9 (Live)
post '/update' => 'status#reg' # Register ones (No histroy)
post '/status' => 'status#update' #Live update
post 'statusdata' => 'status#get' #get live data

#Table 10(Live)
post '/electrical' => 'electrical#reg' #Reg
post '/electupdate' => 'electrical#update' #update Live data
post '/electdata'   => 'electrical#get' #Get live data

#Table 11
post '/streamreg' => 'stream#reg' #Register(histroy)
#post '/streamupdate' => 'stream#update' #Update live data
post '/streamdata'   => 'stream#get' #Get selected windmill last data

#Table 7
post '/logreg'  => 'logbook#reg' # Register (history)
post '/logdata'  => 'logbook#get'

#Table 8
post '/alarmreg' => 'alarmlog#reg'
post '/alarmdata'  => 'alarmlog#get'
post '/demo' => 'alarmlog#demo'

=begin
get '/getallforms' => 'windform#index'
post '/check1' => 'windmill#destroy'
post '/checks' => 'test#regis'
post '/checks1' => 'test#destroy'
post '/checks2' => 'test#update'
post '/details2' => 'user#users'
get '/details3' => 'windform#index'
=end
  end
