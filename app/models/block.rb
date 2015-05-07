class Block < ActiveRecord::Base
  belongs_to :venue
  validates_presence_of :name, :no_of_seats, :left, :right, :top_left, :top_right
end
