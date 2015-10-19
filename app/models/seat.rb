class Seat < ActiveRecord::Base
  
  belongs_to :block
  belongs_to :user
  
  has_one :ticket, dependent: :destroy
  
  validates_presence_of :seat_number, :latitude, :longitude
  
  before_save :uniqueness_of_user_for_venue, if: ->(obj){ obj.user_id.present? }
  
  private
  
  def uniqueness_of_user_for_venue
    level = block.level
    user_seat = Seat.joins(:block => :level).where("levels.venue_id =? && seats.user_id =?", level.venue_id, self.user_id)
    if user_seat.count >= 1
      self.errors.add(:base, "Seat is already assign to this user for #{level.venue.name} venue")
      return false
    end
  end
end
