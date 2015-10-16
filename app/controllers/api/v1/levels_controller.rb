class Api::V1::LevelsController < ApplicationController
  load_and_authorize_resource :except => [:index, :show]
  
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    if @venue.present?
      render json: {:success => true, :data => {venue: @venue.as_json(except: [:created_at, :updated_at],
                                                include: {levels: {except: [:created_at, :updated_at]} } ) } }
    else
      render json: { :success => false, :errors => "No venue exist for the provided venue id"}
    end
  end
  
  def show
    @venue = Venue.find_by_id(params[:venue_id])
    if @venue.present?
      @level = @venue.levels.find_by_id(params[:id])
      if @level.present?
        @lat_longs = @level.lat_longs
        render json: {:success => true, :data => {level: @level.as_json(except: [:created_at, :updated_at],
                                                  include: {lat_longs: {only: [:start, :end] } } ) } }
      else
        render json: {:success => true, :errors => "No level exist for the provided level id"}
      end
    else
      render json: {:success => true, :errors => "No venue exist for the provided venue id"}
    end
  end
end
