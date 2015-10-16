class Api::V1::VenuesController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @venues = Venue.all
    render json: {:success => true, :data => {venues: @venues.as_json(except: [:created_at, :updated_at] ) } }
  end
end
