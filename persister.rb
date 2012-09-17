require 'mongo'

class Persister 


  #save to database
  def persist(activityId, jsonFile)  
    connection = Mongo::Connection.new("localhost", 27017)
    db = Mongo::Connection.new.db("activityRuby")  
    coll = db.collection("activities")
    docummentAndKey = {"activityId" => activityId , "points" => jsonFile}
    id = coll.insert(docummentAndKey)  
  end

  # get from database
  def find(activityId)
    connection = Mongo::Connection.new("localhost", 27017)
    db = Mongo::Connection.new.db("activityRuby")
    coll = db.collection("activities")
    
    puts coll.find("activityId" => activityId ).to_a  
  end

end
