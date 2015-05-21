class Api::V1::SeatsController < ApplicationController
  
  def index
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.find(params[:block_id])
    render json: {:success => true, :data => {block: @block.as_json(except: [:created_at, :updated_at], include:  { seats: { except: [:created_at, :updated_at] } } ) } }
  end
  
end
