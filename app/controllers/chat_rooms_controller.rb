class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: [:show, :destroy, :add_user, :remove_user]

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @users = User.all - @chat_room.users
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      @chat_room.users << current_user
      redirect_to @chat_room, notice: 'Chat room was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @chat_room.destroy
    redirect_to chat_rooms_path, notice: 'Chat room was successfully deleted.'
  end

  def add_user
    user = User.find(params[:user_id])
    if @chat_room.users.exclude?(user)
      @chat_room.users << user
      redirect_to @chat_room, notice: "#{user.email} was successfully added to the chat room."
    else
      redirect_to @chat_room, alert: "#{user.email} is already in the chat room."
    end
  end

  def remove_user
    user = User.find(params[:user_id])
    @chat_room.users.delete(user)
    redirect_to @chat_room, notice: "#{user.email} was successfully removed from the chat room."
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
