class LevelsController < ApplicationController
  before_action :find_venue
  before_action :find_level, except: [:new, :create, :index]
  load_and_authorize_resource
  
  def index
    @levels = @venue.levels
    respond_to do |format|
      format.json { render json: {:success => true, :data => {venue: @venue.as_json(include: :levels) } }}
      format.html {}
    end
  end
  
  def new
    @level = @venue.levels.new
    @level.lat_longs.build
  end
  
  def create
    @level = @venue.levels.new(level_params)
    respond_to do |format|
      if @level.save
        format.json {render json: {:success => true, :data => {message: "Level added successfully." } }}
        format.html {redirect_to venue_levels_path(@venue), notice: "Level added successfully."}
      else
        format.json {render json: {:success => false, :data => {message: @level.errors.full_messages } }}
        format.html {
          flash.now[:error] = @level.errors.full_messages
          @level.lat_longs.build if @level.lat_longs.blank?
          render :new
        }
      end
    end
  end
  
  def show
  end
  
  def edit
    @level.lat_longs.build if @level.lat_longs.blank?
  end
  
  def update
    respond_to do |format|
      if @level.update_attributes(level_params)
        format.json {render json: {:success => true, :data => {message: "Level updated successfully." } }}
        format.html {redirect_to venue_level_path(@venue, @level), notice: "Level updated successfully."}
      else
        format.json {render json: {:success => false , :data => {message: @level.errors.full_messages } }}
        format.html {
          flash.now[:error] = @level.errors.full_messages
          @level.lat_longs.build if @level.lat_longs.blank?
          render :edit
        }
      end
    end
  end
  
  def destroy
    @level.destroy
    respond_to do |format|
      format.json {render json: {:success => true , :data => {message: "Level deleted successfully." } }}
      format.html {redirect_to venue_levels_path(@venue), notice: "Level deleted successfully."}
    end
  end
  
  private
  
  def level_params
    params.require(:level).permit(:name, lat_longs_attributes: [:id, :start, :end, :_destroy])
  end
  
  def find_venue
    @venue = Venue.find(params[:venue_id])
  end
  
  def find_level
    find_venue
    @level = @venue.levels.find(params[:id])
  end  
end
