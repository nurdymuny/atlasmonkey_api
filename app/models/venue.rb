class Venue < ActiveRecord::Base
  validates_presence_of :name, :location
end
