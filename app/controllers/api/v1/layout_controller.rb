module Api
  module V1
    class LayoutController < ApplicationController
    def get_layout
      @seat_layout = SeatLayout.all
      @level = Layout.where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])[0]
      @x_size = @level.grid_size.split('x')[0]
      @y_size = @level.grid_size.split('x')[1]
      # raise @level.inspect
      # raise @seat_layout.inspect
      if @seat_layout.present?
        render status: 200, json: {
                              success: true,
                              levels:{
                                level_id: @level.id,
                                grid:{
                                  x:@x_size,
                                  y:@y_size,
                              seats: @seat_layout,
                            }
                          }
                          }
      else
        render status: 404, json: {
                              success: false,
                              events: [],
                              message: 'No seat found'
                          }
      end

    end

    end
  end
end