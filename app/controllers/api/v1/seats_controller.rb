class Api::V1::SeatsController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    if @venue.present?
      @block = @venue.blocks.find_by_id(params[:block_id])
      if @block.present?
        render json: {:success => true, :data => {block: @block.as_json(except: [:created_at, :updated_at], include:  { seats: { except: [:created_at, :updated_at] } } ) } }
      else
        render json: { :success => false, :errors => "No block exist for the provided block id"}
      end
    else
      render json: { :success => false, :errors => "No venue exist for the provided venue id"}
    end
  end
  
  def get_all_seat_details
    @seats = current_user.seats
    if @seats.present?
      render json: {:success => true, :data => { seats: @seats.as_json(except: [:created_at, :updated_at]) } }
    else
      render json: { :success => false, :errors => "No seat exist for the logged in user"}
    end
  end
  
  def get_seat_detail
    @seat = current_user.seats.find_by_seat_number(params[:seat_number])
    if @seat.present?
      render json: {:success => true, :data => { seat: @seat.as_json(except: [:created_at, :updated_at]) } }
    else
      render json: { :success => false, :errors => "Seat is not exit for the logged in user"}
    end
  end
  
end
