require 'rubygems'  
require 'sinatra'
require 'Parser'
require 'Persister'

get '/' do  
  "Hello, World!"  
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
  @HTMLrides = rides
  #rides.each do |r|
  #  "HELLO" 
  #  "#{r.name}"
  #end
  erb :allActivities
end  

# user info
get '/stravaUser/:id' do  
  parser = Parser.new   
  parser.getUser(params[:id])
end  

__END__
@@ layout
<html>
  <body>
   <%= yield %>
  </body>
</html>

@@ allActivities
<h3>Hello <%= @HTMLrides %>!</h3>



