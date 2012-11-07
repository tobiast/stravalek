# encoding: utf-8
require 'mongo_mapper'

class User
  include MongoMapper::Document

  key :firstname, String
  key :lastname, String 
  key :email, String 
  key :phonenumber, String 
  key :stravaId, String 
  
  many :subscriptions

  def describe
  	puts "#{firstname} #{lastname} <#{email}> #{phonenumber}"
  end
end