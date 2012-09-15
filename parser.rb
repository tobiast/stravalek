require 'rubygems'
require 'open-uri'
require 'json'
require 'Trackpoint'

class Parser

BASE_URL = "http://www.strava.com/api"
USER_URL = BASE_URL + "/v1/rides?athleteId="
ACTIVITY_URL =  BASE_URL + "/v1/streams/" 
ACTIVITIES_URL = BASE_URL + "/v1/rides?athleteId="

def getRide(id)  
  # web_contents  = open('http://www.strava.com/api/v1/streams/21899409') {|f| f.read }
  web_contents  = open(id +'.json') {|f| f.read }    
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


def getRides(id)
    puts "ALL RIDES" + ACTIVITIES_URL + id.to_s
    web_contents  = open(ACTIVITIES_URL + id.to_s) {|f| f.read }
    result = JSON.parse(web_contents)
    rides = result["rides"]
    i=0
    rides.each do
      puts rides[i]["name"];
      puts rides[i]["id"];
      i+=1
    end 
end


end