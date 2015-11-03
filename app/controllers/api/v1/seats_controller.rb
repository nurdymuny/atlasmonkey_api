class Api::V1::SeatsController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    if @venue.present?
      @level = @venue.levels.find_by_id(params[:level_id])
      if @level.present?
        @block = @level.blocks.find_by_id(params[:block_id])
        if @block.present?
          all_seats = []
          @block.seats.map {|seat| all_seats << seat.attributes.merge(level_id: @level.id,
                  level_name: @level.name) }
          render json: {:success => true, :data => {block: @block.as_json(except: [:created_at, :updated_at]).merge(
                                                    seats: all_seats)}}
        else
          render json: { :success => false, :errors => "No block exist for the provided block id"}
        end
      else
        render json: { :success => false, :errors => "No level exist for the provided level id"}
      end
    else
      render json: { :success => false, :errors => "No venue exist for the provided venue id"}
    end
  end
  
  def get_all_seat_details
    @seats = current_user.seats
    if @seats.present?
      user_seats = []
      @seats.map {|seat, block=seat.block| user_seats << seat.attributes.merge(level_id: block.level_id,
                  venue_id: block.level.venue_id) }
      render json: {:success => true, :data => { seats: user_seats } }
    else
      render json: { :success => false, :errors => "No seat exist for the logged in user"}
    end
  end
  
  def get_seat_detail
    if current_user.email == params[:email]
      @seat = current_user.seats.where(user_id: current_user.id)[0]
       #raise @seat.inspect
      if @seat.present?
        @block = Block.select("level_id").where(id: @seat.block_id)[0]
        @level = Level.select("id, venue_id").where(id: @block.level_id)[0]
        @venue = Venue.select("id, name").where(id: @level.venue_id)[0]
        render json: {:success => true, :data => {seat: @seat.as_json(except: [:created_at, :updated_at]).merge(
                                                  venue_id: @venue.id, venue_name: @venue.name, level_id: @level.id) } }
      else
        render json: { :success => false, :errors => "Seat is not exit for the logged in user"}
      end
    end
  end
  
end
