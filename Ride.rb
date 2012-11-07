class Ride
  include MongoMapper::Document

  key :name, String
  key :stravaId, String 
  key :date, String 
  
  def describe
  	puts "#{name} #{stravaId} <#{email}> #{date}"
  end

end
