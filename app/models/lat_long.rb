class LatLong < ActiveRecord::Base

  belongs_to :placeable, polymorphic: :true
  
  validates_presence_of :start, message: "lat,long can't be blank"
  validates_presence_of :end, message: "lat,long can't be blank"
end
