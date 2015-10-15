class Level < ActiveRecord::Base
  
  has_many :blocks, dependent: :destroy
  
  belongs_to :venue
  
  validates_presence_of :name
end
