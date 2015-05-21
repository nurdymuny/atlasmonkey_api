class Api::V1::BlocksController < ApplicationController
  load_and_authorize_resource :except => [:index]
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    @blocks = @venue.blocks
    render json: {:success => true, :data => {venue: @venue.as_json(include: :blocks) } }
  end
  
end
