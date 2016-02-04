class LevelsController < ApplicationController
  before_action :find_venue, except: [:manage_layout, :update_layout, :delete_record, :seat_allocate, :update_user_seat_layout]
  before_action :find_level, except: [:new, :create, :index, :manage_layout, :update_layout, :delete_record, :seat_allocate, :update_user_seat_layout]
  skip_before_action :verify_authenticity_token
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

  def seat_allocate
    @level = Level.where(venue_id: params[:venue_id]).where(id: params[:level_id])[0]

    @venue = Venue.all.where(id: params[:venue_id])[0]
    @layout = Layout.select("id, grid_size").where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])
    @seat_layout = SeatLayout.where(venue_id: params[:venue_id]).where(level_id: params[:level_id])

  end

  def update_user_seat_layout
      # raise params[:already_table_number].inspect
    @user = UserSeatAllocate.where(user_id: params[:user_id])[0]
    # raise @user.inspect
    if @user.present?
      @user.destroy
    end
    @seat = SeatLayout.where(level_id: params[:level_id]).where(venue_id: params[:venue_id]).where(seat_number: params[:already_table_number])[0]
    # raise @seat.inspect
    if @seat.present?
      @User_seat_allocate = UserSeatAllocate.new
      @User_seat_allocate[:x_grid] = @seat.x_grid_ref
      @User_seat_allocate[:y_grid] = @seat.y_grid_ref
      @User_seat_allocate[:seat_id] = params[:already_table_number][0]
      # raise params[:already_table_number].inspect
      @User_seat_allocate[:block_id] = @seat.block_id
      @User_seat_allocate[:uuid_number] = @seat.uuid_number
      @User_seat_allocate[:user_id] = params[:user_id][0]
      @User_seat_allocate[:venue_id] = params[:venue_id]
      @User_seat_allocate[:level_id] = params[:level_id]
      # raise params[:user_id].inspect
      if @User_seat_allocate.save
        flash[:notice] = "Successfully created"
        render :js => 'window.location.reload()'
      else
        render :edit
      end
    end

  end

  def manage_layout
    @level = Level.where(venue_id: params[:venue_id]).where(id: params[:level_id])[0]
    # @block = Block.where(level_id: params[:level_id])
    # raise @level.inspect
    @venue = Venue.all.where(id: params[:venue_id])[0]
    @layout = Layout.select("id, grid_size").where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])
    @seat_layout = SeatLayout.where(venue_id: params[:venue_id]).where(level_id: params[:level_id])
    # @block = Block.select("blocks.id, blocks.name, seat_layouts.seat_number, seat_layouts.block_id").joins("INNER JOIN seat_layouts ON blocks.id = seat_layouts.block_id").where("seat_layouts.seat_number = '#{@seat_layout.seat_number}'")
    # raise @seat_layout.inspect

  end

  def update_layout

      if (params[:type] == '1')
        @x_size = params[:x_grid]
        @y_size = params[:y_grid]
        @level_ids = params[:level_id]
        @grid_size = @x_size.to_s+'x'+@y_size.to_s
        # raise @grid_size.inspect
        @layout = Layout.where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])[0]
        if @layout.present?
          @layout.update_attributes(grid_size: @grid_size, level_ids: @level_ids)
          flash[:notice] = "Successfully updated"
          render :js => 'window.location.reload()'
        else
          @layout = Layout.new
          @layout[:grid_size] = params[:x_grid].to_s+'x'+params[:y_grid].to_s
          @layout[:venue_id] = params[:venue_id]
          @layout[:level_ids] = params[:level_id]
          if @layout.save
            flash[:notice] = "Successfully created"
            render :js => 'window.location.reload()'
          else
            render :edit
          end
        end
      elsif params[:type] == '0'
        @seat = SeatLayout.where(id: params[:already_diner_id])[0]
        @seat_number = params[:already_table_number][0]
        @uuid_number = params[:already_uuid_number][0]
        if @seat.present?
          @seat.update_attribute(:seat_number, @seat_number)
          @seat.update_attribute(:uuid_number, @uuid_number)
          flash[:notice] = "Successfully updated"
          render :js => 'window.location.reload()'
        end

      else (params[:type] == '2')
        @count = params[:seat_number].count
        @block_id = params[:block_id]
        # raise @count
        puts @count
        index = 0
      @errors = Array.new
        while (index < @count)
            puts index
            @seat_number = params[:seat_number][index]
            @uuid_number = params[:uuid_number][index]
            @table_col_val = params[:table_col_val][index]
            if @table_col_val.to_s.length >= 3
              @y_ref = @table_col_val[-1, 1]
              @x_ref = @table_col_val[0,2]
              # raise @x_ref.inspect

            else
              @x_ref = @table_col_val[0]
              # raise @x_ref.inspect
              @y_ref = @table_col_val[1]
            end
            if @table_col_val.to_s.length >= 4
              @y_ref = @table_col_val[-2, 2]
              # raise @y_ref.inspect
              @x_ref = @table_col_val[0,2]
              # raise @x_ref.inspect

            end


            @Layout = Layout.where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])[0]
            @SeatLayout = SeatLayout.new
            @SeatLayout[:layout_id] = @Layout.id
            @SeatLayout[:seat_number] = @seat_number
            @SeatLayout[:uuid_number] = @uuid_number
            @SeatLayout[:level_id] = params[:level_id]
            @SeatLayout[:venue_id] = params[:venue_id]
            @SeatLayout[:block_id] = @block_id
            @SeatLayout[:x_grid_ref] = @x_ref
            @SeatLayout[:y_grid_ref] = @y_ref
            if @SeatLayout.save
              if @Layout.seat_layout_ids != nil
                if not @Layout.seat_layout_ids.empty?
                  @Layout.update_attribute(:seat_layout_ids, @Layout.seat_layout_ids+'|'+@SeatLayout.id.to_s)
                else
                  @Layout.update_attribute(:seat_layout_ids, @SeatLayout.id.to_s)
                end
              else
                @Layout.update_attribute(:seat_layout_ids, @SeatLayout.id.to_s)
              end

            else
              render :edit
            end
            index = index + 1;
        end
        flash[:notice] = "Successfully updated"
        render :js => 'window.location.reload()'
      end
  end

  def delete_record
    # raise params.inspect
    @seat_layouts = SeatLayout.find(params[:seat_id])
    # raise @seat_layouts.inspect
    if @seat_layouts.destroy

    end
    @layouts = Layout.where(level_ids: params[:level_id])[0]
    # raise @layouts.inspect
    if @layouts.present?
      @layout = @layouts.seat_layout_ids.split('|')
      @layout.delete_if{|i|i==params[:seat_id].to_s}
      @layout = @layout.join('|')
      @layouts.update_attribute(:seat_layout_ids, @layout.to_s)
    end
    flash[:notice] = "Successfully deleted"
    render :js => 'window.location.reload()'
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
