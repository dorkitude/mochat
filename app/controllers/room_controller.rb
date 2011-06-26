class RoomController < ApplicationController

  def index
    @rooms = Room.find(:all, :order => "updated_at DESC").paginate :page => params[:page]
  end

  def show
  end

  def new
    @f = params
  end

  def create
    title = params[:title]

    if title.length < 1
      flash[:error] = "You must provide a title for your room."
      return redirect_to params.merge :action => :new
    end

    if Room.find_by_title(title)
      flash[:error] = "Sorry, there is already a room called '#{title}'."
      return redirect_to params.merge :action => :new
    end

    room = Room.new
    room.title = title
    room.topic = params[:topic]
    room.user = @user
    room.last_message_at = Time.now
    room.save

    return redirect_to :action => :show, :id => room.id  

  end

end
