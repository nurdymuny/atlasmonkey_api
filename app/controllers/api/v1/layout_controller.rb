module Api
  module V1
    class LayoutController < ApplicationController
    def get_layouts
      @seat_layouts = SeatLayout.all
      @seat_layouts.each do |seat_layout|
          @seat_number = seat_layout.seat_number
      end
      @level = Layout.where(venue_id: params[:venue_id]).where(level_ids: params[:level_id])[0]
      if @level.present?
          @x_size = @level.grid_size.split('x')[0]
          @y_size = @level.grid_size.split('x')[1]
      end
      if @seat_layouts.present?
          if @level.present?
            render status: 200, json: {
                              success: true,
                              levels:{
                                level_id: @level.level_ids,
                                grid:{
                                  x:@x_size,
                                  y:@y_size,
                              seats: {
                                  seat_number: @seat_number


                              }
                            }
                          }
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
      render status: 200, json: {
                            success: true,
                            seats:
                                {
                                    seat_id:23,
                                    block_id:4,
                                    uuid: '74278BDA-B644-4520-8F0C-720EAF059935',
                                    row: 'D',
                                    seat_number:7,
                                    grid:{
                                        x:7,
                                        y:8
                                    },

                                    is_path: false
                                }

                        }

    end
    def get_layout
      render status: 200, json: {
                            success: true,
                            levels:{
                                level_id: 1,
                                grid: {
                                    x:9,
                                    y:10
                                },
                                seats:[
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:1
                                        },
                                        is_path: true
                                    }, {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:2
                                        },
                                        is_path: true
                                    }, {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:3
                                        },
                                        is_path: true
                                    }, {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:4
                                        },
                                        is_path: true
                                    }, {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:5
                                        },
                                        is_path: true
                                    }, {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:6
                                        },
                                        is_path: true
                                    }, {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:7
                                        },
                                        is_path: true
                                    },{
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:8
                                        },
                                        is_path: true
                                    },{
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:0,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '0',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:1
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:2
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:3
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:6
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:7
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:8
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:1,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:2,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:1,
                                        block_id:1,
                                        uuid: '',
                                        row: 'A',
                                        seat_number:1,
                                        grid:{
                                            x:2,
                                            y:1
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:2,
                                        block_id:1,
                                        uuid: '',
                                        row: 'A',
                                        seat_number:2,
                                        grid:{
                                            x:2,
                                            y:2
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:5,
                                        block_id:1,
                                        uuid: '',
                                        row: 'A',
                                        seat_number:0,
                                        grid:{
                                            x:2,
                                            y:3
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:2,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:2,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:6,
                                        block_id:2,
                                        uuid: '999557E7-23E4-4BED-988A-A02FE47F9001',
                                        row: 'A',
                                        seat_number:2,
                                        grid:{
                                            x:2,
                                            y:6
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:7,
                                        block_id:2,
                                        uuid: '',
                                        row: 'A',
                                        seat_number:2,
                                        grid:{
                                            x:2,
                                            y:7
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:8,
                                        block_id:2,
                                        uuid: '',
                                        row: 'A',
                                        seat_number:2,
                                        grid:{
                                            x:2,
                                            y:8
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:2,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:1
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:2
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:3
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:6
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:7
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:8
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:3,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:4,
                                            y:0
                                        },
                                        is_path: true
                                    },

                                    {
                                        seat_id:11,
                                        block_id:3,
                                        uuid: '',
                                        row: 'C',
                                        seat_number:1,
                                        grid:{
                                            x:4,
                                            y:1
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:12,
                                        block_id:3,
                                        uuid: '',
                                        row: 'C',
                                        seat_number:2,
                                        grid:{
                                            x:4,
                                            y:2
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:17,
                                        block_id:4,
                                        uuid: '',
                                        row: 'C',
                                        seat_number:1,
                                        grid:{
                                            x:4,
                                            y:3
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:4,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:4,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:18,
                                        block_id:4,
                                        uuid: '',
                                        row: 'C',
                                        seat_number:2,
                                        grid:{
                                            x:4,
                                            y:6
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:19,
                                        block_id:4,
                                        uuid: 'B9407F30-F5F8-466E-AFF9-25556B57FE6D',
                                        row: 'C',
                                        seat_number:3,
                                        grid:{
                                            x:4,
                                            y:7
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:20,
                                        block_id:4,
                                        uuid: '',
                                        row: 'C',
                                        seat_number:4,
                                        grid:{
                                            x:4,
                                            y:8
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:4,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:1
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:2
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:3
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:6
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:7
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:8
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:5,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:1
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:2
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:3
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:6
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:7
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:8
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:6,
                                            y:9
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:7,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:13,
                                        block_id:3,
                                        uuid: '',
                                        row: 'D',
                                        seat_number:3,
                                        grid:{
                                            x:7,
                                            y:1
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:14,
                                        block_id:3,
                                        uuid: '',
                                        row: 'D',
                                        seat_number:4,
                                        grid:{
                                            x:7,
                                            y:2
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:20,
                                        block_id:4,
                                        uuid: '',
                                        row: 'D',
                                        seat_number:4,
                                        grid:{
                                            x:7,
                                            y:3
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:7,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:7,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:21,
                                        block_id:4,
                                        uuid: '',
                                        row: 'D',
                                        seat_number:5,
                                        grid:{
                                            x:7,
                                            y:6
                                        },
                                        is_path: false
                                    },
                                    {
                                        seat_id:22,
                                        block_id:4,
                                        uuid: '',
                                        row: 'D',
                                        seat_number:6,
                                        grid:{
                                            x:7,
                                            y:7
                                        },

                                        is_path: false
                                    },{
                                        seat_id:23,
                                        block_id:4,
                                        uuid: '74278BDA-B644-4520-8F0C-720EAF059935',
                                        row: 'D',
                                        seat_number:7,
                                        grid:{
                                            x:7,
                                            y:8
                                        },

                                        is_path: false
                                    },{
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:7,
                                            y:9
                                        },

                                        is_path: true
                                    },{
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:0
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:1
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:2
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:3
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:4
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:5
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:6
                                        },
                                        is_path: true
                                    },
                                    {
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:7
                                        },

                                        is_path: true
                                    },{
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:8
                                        },

                                        is_path: true
                                    },{
                                        seat_id:0,
                                        block_id:0,
                                        uuid: '',
                                        row: '',
                                        seat_number:0,
                                        grid:{
                                            x:8,
                                            y:9
                                        },

                                        is_path: true
                                    }
                                ]
                            }

                        }

    end
    end
  end
end