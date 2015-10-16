class Level < ActiveRecord::Base
  
  has_many :blocks, dependent: :destroy
  has_many :lat_longs, as: :placeable, dependent: :destroy
  
  belongs_to :venue
  
  validates_presence_of :name
  
  accepts_nested_attributes_for :lat_longs, :allow_destroy => true, :reject_if => :all_blank
end
