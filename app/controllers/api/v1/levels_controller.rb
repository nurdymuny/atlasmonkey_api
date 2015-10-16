class Api::V1::LevelsController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    if @venue.present?
      render json: {:success => true, :data => {venue: @venue.as_json(except: [:created_at, :updated_at],
                                                include: {levels: {except: [:created_at, :updated_at]} } ) } }
    else
      render json: { :success => false, :errors => "No venue exist for the provided venue id"}
    end
  end
end
