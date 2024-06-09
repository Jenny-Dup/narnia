class MessagesController < ApplicationController
  def create
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message = @chat_room.messages.build(message_params.merge(user: current_user))

    if @message.save
      respond_to do |format|
        format.html { redirect_to @chat_room }
        format.js { render partial: 'messages/message', locals: { message: @message } }
      end
    else
      respond_to do |format|
        format.html { render 'chat_rooms/show' }
        format.js { render js: "alert('Error saving message');" }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
