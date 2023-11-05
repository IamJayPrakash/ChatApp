# frozen_string_literal: true

class RoomsController < ApplicationController
  def index
    # binding.pry
    @room = Room.new
    # @messages = Message.all
    @current_user = current_user
    redirect_to '/signin' unless @current_user
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
  end

  def create
    @room = Room.create(name: params['room']['name'])
  end

  def show
    @current_user = current_user
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @users = User.all_except(@current_user)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    render 'index'
  end
end
