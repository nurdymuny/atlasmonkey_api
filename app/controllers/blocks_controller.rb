class BlocksController < ApplicationController
  before_action :find_venue
  before_action :find_block, except: [:new, :create, :index]
  load_and_authorize_resource
  
  def index
    @blocks = @venue.blocks
    respond_to do |format|
      format.json { render json: {:success => true, :data => {venue: @venue.as_json(include: :blocks) } }}
      format.html {}
    end
  end
  
  def new
    @block = @venue.blocks.new
  end
  
  def create
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
  
  def show
  end
  
  def edit
  end
  
  def update
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
  
  def find_venue
    @venue = Venue.find(params[:venue_id])
  end
    
  def find_block
    find_venue
    @block = @venue.blocks.find(params[:id])
  end  
    
end
