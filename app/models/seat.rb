class Seat < ActiveRecord::Base
  belongs_to :block
  has_one :ticket
  validates_presence_of :seat_number, :latitude, :longitude
end
