module Api
  module V1
    class LayoutController < ApplicationController
    def seat_layout
      @seat_layouts = SeatLayout.all

      layout = Layout.where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])[0]
      if @seat_layouts.present?
          if layout.present?
              seats = []
              for x in (0...layout.grid_size.split('x')[0].to_i) do
                  for y in (0...layout.grid_size.split('x')[1].to_i) do
                      seat_dict = {}
                     seat = SeatLayout.where(layout_id: layout.id, x_grid_ref: x, y_grid_ref: y)[0]
                      if seat.present?
                          seat_dict = {seat_number: seat.seat_number,
                                  block_id: seat.block_id,
                                  uuid: seat.uuid_number,
                                  grid: {
                                      x: seat.x_grid_ref,
                                      y: seat.y_grid_ref
                                  },
                                is_path: false
                          }
                      else
                          seat_dict = {seat_number: 0,
                                  block_id: 0,
                                  uuid: '',
                                  grid: {
                                      x: x,
                                      y: y
                                  },
                                  is_path: true
                          }
                      end
                      seats.append(seat_dict)
                  end

              end
                      # @level << level_detail
            render status: 200, json: {
                              success: true,
                              levels: {
                                  level_id: layout.id,
                                  grid:{
                                      x: layout.grid_size.split('x')[0],
                                      y: layout.grid_size.split('x')[1]
                                  },

                              seats: seats
              },
                          }
          else
            render status: 404, json: {
                                  success: false,
                                  events: [],
                                  message: 'No found'
                              }

          end
      else
          render status: 404, json: {
                                success: false,
                                events: [],
                                message: 'No seat found'
                            }
      end

    end
    def get_user_seat_info
        @user_seat_allocate = UserSeatAllocate.where(user_id: params[:user_id])[0]
        if @user_seat_allocate.present?
            render status: 200, json: {
                                  success: true,
                                  seats:{
                                      seat_id: @user_seat_allocate.seat_id,
                                      block_id: @user_seat_allocate.block_id,
                                      uuid: @user_seat_allocate.uuid_number,
                                      grid:{
                                          x: @user_seat_allocate.x_grid,
                                          y: @user_seat_allocate.y_grid
                                      },
                                      is_path: false
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