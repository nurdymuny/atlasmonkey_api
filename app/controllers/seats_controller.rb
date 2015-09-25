class SeatsController < ApplicationController
  before_action :find_block
  before_action :find_seat, only: [:show,:edit,:update,:destroy]
  before_filter :initialize_seat ,only: [:create]
  load_and_authorize_resource

  def index
    @all_seats = @block.seats
     respond_to do |format|
      format.json { render json: {:success => true , :data => {seats: @all_seats} }}
      format.html { }
    end
  end

  def new
    @seat =  @block.seats.new
  end

  def create
    respond_to do |format|
      if @seat.save
        format.json {render json: {:success => true , :data => {message: "Seat added successfully." } }}
        format.html {redirect_to venue_block_seats_path(@venue, @block),notice: "Seat added successfully." }
      else
        format.json {render json: {:success => false, :data => {message: @seat.errors.full_messages } }}
        format.html {
          flash.now[:error] = @seat.errors.full_messages
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
      if @seat.update_attributes(seats_params)
        format.json {render json: {:success => true, :data => {message: "Seat updated successfully." } }}
        format.html {redirect_to venue_block_seats_path(@venue, @block), notice: "Seat updated successfully."}
      else
        format.json {render json: {:success => false, :data => {message: @seat.errors.full_messages } }}
        format.html {
          flash.now[:error] = @seat.errors.full_messages
          render :edit
        }
      end
    end
  end

  def destroy 
    @seat.destroy
    respond_to do |format|
      format.json {render json: {:success => true, :data => {message: "Seat deleted successfully." } }}
      format.html {redirect_to venue_block_seats_path(@venue, @block), notice: "Seat deleted successfully."}
    end    
  end

  private

  def seats_params
    params.require(:seat).permit(:block_id,:seat_number,:latitude,:longitude)
  end

  def find_block
    @venue = Venue.find(params[:venue_id])
    @block = @venue.blocks.find(params[:block_id])
  end

  def find_seat
    find_block
    @seat = @block.seats.find(params[:id])
  end

  def initialize_seat
    find_block
    @seat = @block.seats.new(seats_params)
  end
end
