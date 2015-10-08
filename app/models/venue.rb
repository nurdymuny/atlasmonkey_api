class Venue < ActiveRecord::Base

  has_many :blocks, dependent: :destroy
  
  validates_presence_of :name, :location
  validates_presence_of :start, message: "lat, long can't be blank"
  validates_presence_of :end, message: "lat, long can't be blank"
end
