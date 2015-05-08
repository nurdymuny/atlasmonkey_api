class Api::V1::SeatsController < ApplicationController
  before_action :find_block, only:[:new,:create,:show,:index,:edit,:update,:destroy]
  before_action :find_seat, only: [:show,:edit,:update,:destroy]
  before_filter :initialize_seat ,only: [:create]
  load_and_authorize_resource

  def index
    @venue = @block.venue
    @all_seats = @block.seats
     respond_to do |format|
      format.json { render json: {state: {:code => 1}, :data => {seats: @all_seats} }}
      format.html { }
    end
  end

  def new
    @seat =  @block.seats.new
  end

  def create
    respond_to do |format|
      if @seat.save
        format.json {render json: {state: {:code => 1}, :data => {message: "Seat added successfully." } }}
        format.html {redirect_to api_v1_block_seat_path(@block,@seat),notice: "Seat added successfully." }
      else
        format.json {render json: {state: {:code => 0}, :data => {message: @seat.errors.full_messages } }}
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
      if @seat.update_attributes(seats_params)
        format.json {render json: {state: {:code => 1}, :data => {message: "Seat updated successfully." } }}
        format.html {redirect_to api_v1_block_seat_path(@block,@seat)}
      else
        format.json {render json: {state: {:code => 0}, :data => {message: @seat.errors.full_messages } }}
        format.html {render :edit}
      end
    end

  end

  def destroy 
    if @seat.destroy
      respond_to do |format|
        format.json {render json: {state: {:code => 1}, :data => {message: "Seat deleted successfully." } }}
        format.html {redirect_to api_v1_block_seats_path(@block)}
      end
    else
      format.json {render json: {state: {:code => 0}, :data => {message: @seat.errors.full_messages } }}
      format.html {redirect_to api_v1_block_seats_path(@block)}
    end

  end


  private

  def seats_params
    params.require(:seat).permit(:block_id,:seat_number,:latitude,:longitude)
  end

  def find_block
    @block = Block.find(params[:block_id])
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
