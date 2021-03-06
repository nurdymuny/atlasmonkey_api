class VenuesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @venues = Venue.all
    respond_to do |format|
      format.json { render json: {:success => true, :data => {venues: @venues } }}
      format.html {}
    end
  end
  
  def new
    @venue = Venue.new
    @venue.levels.build
  end
  
  def create
    @venue = Venue.new(venue_params)
    respond_to do |format|
      if @venue.save
        format.json {render json: {:success => true, :data => {message: "Venue added successfully." } }}
        format.html {redirect_to venues_path, notice: "Venue added successfully."}
      else
        format.json {render json: {:success => false , :data => {message: @venue.errors.full_messages } }}
        format.html {
          flash.now[:error] = @venue.errors.full_messages
          @venue.levels.build if @venue.levels.blank?
          render :new
        }
      end
    end
  end
  
  def show
    @venue = Venue.find(params[:id])
  end
  
  def edit
    @venue = Venue.find(params[:id])
    @venue.levels.build if @venue.levels.blank?
  end
  
  def update
    @venue = Venue.find(params[:id])
    respond_to do |format|
      if @venue.update_attributes(venue_params)
        format.json {render json: {:success => true, :data => {message: "Venue updated successfully." } }}
        format.html {redirect_to venues_path, notice: "Venue updated successfully."}
      else
        format.json {render json: {:success => false, :data => {message: @venue.errors.full_messages } }}
        format.html {
          flash.now[:error] =  @venue.errors.full_messages
          @venue.levels.build if @venue.levels.blank?
          render :edit
        }
      end
    end
  end
  
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    respond_to do |format|
      format.json {render json: {:success => true, :data => {message: "Venue deleted successfully." } }}
      format.html {redirect_to venues_path, notice: "Venue deleted successfully."}
    end
  end
  
  private
    def venue_params
      params.require(:venue).permit(:name, :location, levels_attributes: [:id, :name, :_destroy])
    end
end
