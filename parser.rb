require 'rubygems'
require 'open-uri'
require 'json'
require 'Trackpoint'
require 'Ride'

class Parser

BASE_URL = "http://www.strava.com/api"
USER_URL = BASE_URL + "/v1/rides?athleteId="
ACTIVITY_URL =  BASE_URL + "/v1/streams/" 
ACTIVITIES_URL = BASE_URL + "/v1/rides?athleteId="

def getRide(rideId)  
  # web_contents  = open('http://www.strava.com/api/v1/streams/21899409') {|f| f.read }
  web_contents  = open(rideId +'.json') {|f| f.read }    
  result = JSON.parse(web_contents)
    
  points = []
  numberOfPoints = result["time"].size
  numberOfPoints.times {
    |i|   
    points[i] =  Trackpoint.new
    result.map do |k,v| 
      # calls the method with name key and sets value
      points[i].send(k+"=", v[i])
    end        
  }
  return points.to_json
end 


def getRides(riderId)
    puts "ALL RIDES for rider: " + ACTIVITIES_URL + riderId.to_s
  
    web_contents  = open(ACTIVITIES_URL + riderId.to_s) {|f| f.read }
    result = JSON.parse(web_contents)
    rides = result["rides"]
    i=0
    mappedRides = []
    rides.each do
      puts "mapped ride"
      mappedRides[i] = Ride.new   
      mappedRides[i].name = rides[i]["name"];
      mappedRides[i].id = rides[i]["id"];
      i+=1
    end 
    return mappedRides
end

end