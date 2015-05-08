class Seat < ActiveRecord::Base
  belongs_to :block
  validates_presence_of :seat_number, :latitude, :longitude
end
