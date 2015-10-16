class Venue < ActiveRecord::Base

  has_many :levels, dependent: :destroy
  
  validates_presence_of :name, :location
  
  accepts_nested_attributes_for :levels, :allow_destroy => true, :reject_if => :all_blank
end
