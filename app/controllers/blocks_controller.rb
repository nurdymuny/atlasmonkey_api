class BlocksController < ApplicationController
  before_action :find_level
  before_action :find_block, except: [:new, :create, :index]
  load_and_authorize_resource
  
  def index
    @blocks = @level.blocks
    respond_to do |format|
      format.json { render json: {:success => true, :data => {level: @level.as_json(include: :blocks) } }}
      format.html {}
    end
  end
  
  def new
    @block = @level.blocks.new
  end
  
  def create
    @block = @level.blocks.new(block_params)
    respond_to do |format|
      if @block.save
        format.json {render json: {:success => true, :data => {message: "Block added successfully." } }}
        format.html {redirect_to venue_level_blocks_path(@venue, @level), notice: "Block added successfully."}
      else
        format.json {render json: {:success => false, :data => {message: @block.errors.full_messages } }}
        format.html {
          flash.now[:error] = @block.errors.full_messages
          render :new
        }
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
        format.html {redirect_to venue_level_block_path(@venue, @level, @block), notice: "Block updated successfully."}
      else
        format.json {render json: {:success => false , :data => {message: @block.errors.full_messages } }}
        format.html {
          flash.now[:error] = @block.errors.full_messages
          render :edit
        }
      end
    end
  end
  
  def destroy
    @block.destroy
    respond_to do |format|
      format.json {render json: {:success => true , :data => {message: "Block deleted successfully." } }}
      format.html {redirect_to venue_level_blocks_path(@venue, @level), notice: "Block deleted successfully."}
    end
  end
  
  private
    
  def block_params
    params.require(:block).permit(:name, :no_of_seats, :left, :right, :top_left, :top_right)
  end
  
  def find_level
    @venue = Venue.find(params[:venue_id])
    @level = @venue.levels.find(params[:level_id])
  end
    
  def find_block
    find_level
    @block = @level.blocks.find(params[:id])
  end  
    
end
