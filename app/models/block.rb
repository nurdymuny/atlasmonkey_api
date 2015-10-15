class Block < ActiveRecord::Base
  belongs_to :level
  has_many :seats, dependent: :destroy
  validates_presence_of :name, :no_of_seats, :left, :right, :top_left, :top_right
end
