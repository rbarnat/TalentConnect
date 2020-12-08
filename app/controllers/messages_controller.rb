class MessagesController < ApplicationController
  def new
  @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id 
    @message.chat_room_id = 1
    @message.recipient_id = 1
    @message.save
    redirect_to talent_chat_room_path(params[:talent_id], 1)
  end      



private

# Allow place nested form attribute to pass
def message_params
  params.require(:message).permit(:content, :talent_id)
end


end
