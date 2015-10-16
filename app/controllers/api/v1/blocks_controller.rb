class Api::V1::BlocksController < ApplicationController
  load_and_authorize_resource :except => [:index]
  
  def index
    @venue = Venue.find_by_id(params[:venue_id])
    if @venue.present?
      @level = @venue.levels.find_by_id(params[:level_id])
      if @level.present?
        render json: {:success => true, :data => {level: @level.as_json(except: [:created_at, :updated_at],
                                                  include: {blocks: {except: [:created_at, :updated_at]} } ) } }
      else
        render json: { :success => false, :errors => "No level exist for the provided level id"}
      end
    else
      render json: { :success => false, :errors => "No venue exist for the provided venue id"}
    end
  end
end
