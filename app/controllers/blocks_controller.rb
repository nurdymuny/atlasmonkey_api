class BlocksController < ApplicationController
  load_and_authorize_resource :except => [:index]
  def index
    @venue = Venue.find(params[:venue_id])
    @blocks = @venue.blocks
    respond_to do |format|
      format.json { render json: {:success => true, :data => {venue: @venue.as_json(include: :blocks) } }}
      format.html {}
    end
  end
  
  def new
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.new
  end
  
  def create
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.new(block_params)
    respond_to do |format|
      if @block.save
        format.json {render json: {:success => true, :data => {message: "Block added successfully." } }}
        format.html {redirect_to venue_blocks_path(@venue)}
      else
        format.json {render json: {:success => false, :data => {message: @block.errors.full_messages } }}
        format.html {render :new}
      end
    end
  end
  
  def edit
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.find(params[:id])
  end
  
  def update
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.find(params[:id])
    respond_to do |format|
      if @block.update_attributes(block_params)
        format.json {render json: {:success => true, :data => {message: "Block updated successfully." } }}
        format.html {redirect_to venue_blocks_path(@venue)}
      else
        format.json {render json: {:success => false , :data => {message: @block.errors.full_messages } }}
        format.html {render :edit}
      end
    end
  end
  
  def destroy
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.find(params[:id])
    @block.destroy
    respond_to do |format|
      format.json {render json: {:success => true , :data => {message: "Block deleted successfully." } }}
      format.html {redirect_to venue_blocks_path(@venue)}
    end
  end
  
  private
    def block_params
      params.require(:block).permit(:name, :no_of_seats, :left, :right, :top_left, :top_right)
    end
end
