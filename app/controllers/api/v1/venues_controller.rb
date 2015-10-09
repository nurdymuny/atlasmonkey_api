class Api::V1::VenuesController < ApplicationController
  load_and_authorize_resource :except => [:show]
  
  def show
    @venue = Venue.find_by_id(params[:id])
    if @venue.present?
      @lat_longs = @venue.lat_longs
      render json: {:success => true, :data => {venue: @lat_longs.as_json(only: [:start, :end]) } }
    else
      render json: {:success => true, :errors => "No venue exist for the provided venue id"}
    end
  end
end
