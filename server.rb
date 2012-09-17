require 'sinatra'
require 'Haml'

require_relative 'Parser'
require_relative 'Persister'

get '/' do  
  haml :index
end

# if a user wants to fetch an activity
get '/stravaActivity/:id' do  
  puts "Getting all info on ride"
  puts params[:id]    
  parser = Parser.new  
  persister = Persister.new 
  persister.persist(params[:id], parser.getRide(params[:id]))
  persister.find(params[:id])
  "persisted activity"
end  

# all activities for a user
get '/stravaActivities/all' do    
  puts "Getting all activities for users"
  parser = Parser.new  
  rides = parser.getRides("16502")
  puts "number of rides" + rides.size.to_s
  @activities = rides
  haml :allActivities
end  

# user info
get '/stravaUser/:id' do  
  parser = parser.new   
  parser.getUser(params[:id])
end  

