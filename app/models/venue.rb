class Venue < ActiveRecord::Base
  validates_presence_of :name, :location
  has_many :blocks
end
