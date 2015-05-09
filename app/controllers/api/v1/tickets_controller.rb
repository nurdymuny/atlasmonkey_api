class Api::V1::TicketsController < Api::V1::ApiBaseController

  def add_ticket_detail
    @ticket = Ticket.find_or_create_by(ticket_params)
    if @ticket.persisted?
      render  :status => 200,
              :json => { :success => true,
              :info => "ticket detail saved",
              :user => @ticket.as_json(except:[:created_at,:updated_at] )}
    else
      render  :status => 400,
             :json => { :success => false,
                        :errors =>  @ticket.errors.full_messages
                       }
    end
  end


  
  private

  def ticket_params
    params.require(:ticket).permit(:unique_ticket_id,:seat_id,:block_id)
  end

end
