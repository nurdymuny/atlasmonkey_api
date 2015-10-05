class Seat < ActiveRecord::Base
  
  belongs_to :block
  belongs_to :user
  
  has_one :ticket, dependent: :destroy
  
  validates_presence_of :seat_number, :latitude, :longitude
end
