require 'Haml'
require 'sinatra'  
require 'active_support/core_ext'
require 'mongo_mapper'
require 'net/http'

require_relative 'Parser'
require_relative 'Persister'
require_relative 'User'

class App < Sinatra::Base

  get '/' do  
    haml :index
  end

  get '/users/:id' do 
    puts("getting user with id " + params[:id])
    user = User.find_by_id(params[:id])
    user.to_json
  end

  get '/users' do
    puts("getting user")  
    users = User.all
    users.to_json
  end

  # create a new user 
  post '/users' do 
    puts("creating user")
    userdata = JSON.parse(request.body.read.to_s)  
    newuser = User.new(userdata) 
    newuser.save
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
    haml :boot
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

end

