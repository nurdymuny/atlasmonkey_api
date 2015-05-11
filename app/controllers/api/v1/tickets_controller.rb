class Api::V1::TicketsController < Api::V1::ApiBaseController

  #def add_ticket_detail
  #  @ticket = Ticket.find_or_create_by(ticket_params)
  #  if @ticket.persisted?
  #    render  :status => 200,
  #            :json => { :success => true,
  #            :info => "ticket detail saved",
  #            :user => @ticket.as_json(except:[:created_at,:updated_at] )}
  #  else
  #    render  :status => 400,
  #            :json => { :success => false,
  #            :errors =>  @ticket.errors.full_messages}
  #  end
  #end


  def get_ticket_detail
    @ticket_detail = Ticket.where("unique_ticket_id=?",params[:unique_ticket_id])
    @seat_detail = Seat.where("id = ? and block_id= ?",@ticket_detail.first.seat_id,@ticket_detail.first.block_id) if @ticket_detail.present?
    if @seat_detail.present?
      render  :status => 200,
              :json => { :success => true,
              :info => "seat detail",
              :user =>  @seat_detail.as_json(except:[:created_at,:updated_at] ) }
    else
      render  :status => 400,
              :json => { :success => false,
              :errors => "error "}
    end
  end


  private

  def ticket_params
    params.require(:ticket).permit(:unique_ticket_id,:seat_id,:block_id)
  end

end
