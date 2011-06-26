class MessageController < ApplicationController
  before_filter :login_required

  def new
    @room = Room.find(params[:room_id])

    if not @room
      flash[:error] = "Invalid room_id: #{params[:room_id]}"
      return redirect_to :controller => :rooms, :action => :index
    end
  end

  def create
    @room = Room.find(params[:room_id])

    if not @room
      flash[:error] = "Invalid room_id: #{params[:room_id]}"
      return redirect_to :controller => :rooms, :action => :index
    end

    content = params[:content]

    if content.length == 0
      flash[:error] = "You have to enter a message."
      return redirect_to :action => :new
    end

    message = Message.new
    message.user = @user
    message.room = @room
    message.contents = content
    message.save

    return redirect_to :controller => :room, :action => :show, :id => @room.id

  end

end
