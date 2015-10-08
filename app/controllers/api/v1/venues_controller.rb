class Api::V1::VenuesController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @venues = Venue.all
    render json: {:success => true, :data => {venue: @venues.as_json(only: [:start, :end]) } }
  end
end
