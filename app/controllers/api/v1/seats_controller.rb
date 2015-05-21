class Api::V1::SeatsController < ApplicationController
  
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
  
end
