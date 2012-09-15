require 'rubygems'  
require 'sinatra'
require 'Parser'
require 'Persister'

get '/' do  
  "Hello, World!"  
end

# if a user wants to fetch an activity
get '/stravaActivity/:id' do  
  puts params[:id]    
  parser = Parser.new  
  persister = Persister.new 
  persister.persist(params[:id], parser.getRide(params[:id]))
  
  persister.find(params[:id])
end  

# all activities for a user
get '/stravaActivities/all' do    
  puts "all fucking activities"
  parser = Parser.new  
  parser.getRides("16502")
end  

# user info
get '/stravaUser/:id' do  
  parser = Parser.new   
  parser.getUser(params[:id])
end  



