class Api::V1::VenuesController < ApplicationController
  
  def index
    @venues = Venue.all
  end
  
  def new
    @venue = Venue.new
  end
  
  def create
    @venue = Venue.new(venue_params)
    respond_to do |format|
      if @venue.save
        format.html {redirect_to api_v1_venues_path}
        format.json {render json: {state: {:code => 1}, :data => {message: "Venue added successfully." } }}
      else
        format.html {render :new}
        format.json {render json: {state: {:code => 0}, :data => {message: @venue.errors.full_messages } }}
      end
    end
  end
  
  def show
    @venue = Venue.find(params[:id])
  end
  
  def edit
    @venue = Venue.find(params[:id])
  end
  
  def update
    @venue = Venue.find(params[:id])
    respond_to do |format|
      if @venue.update_attributes(venue_params)
        format.html {redirect_to api_v1_venues_path}
        format.json {render json: {state: {:code => 1}, :data => {message: "Venue updated successfully." } }}
      else
        format.html {render :edit}
        format.json {render json: {state: {:code => 0}, :data => {message: @venue.errors.full_messages } }}
      end
    end
  end
  
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    respond_to do |format|
      format.html {redirect_to api_v1_venues_path}
      format.json {render json: {state: {:code => 1}, :data => {message: "Venue deleted successfully." } }}
    end
  end
  
  private
    def venue_params
      params.require(:venue).permit(:name, :location)
    end
end
