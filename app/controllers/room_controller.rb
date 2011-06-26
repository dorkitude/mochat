class RoomController < ApplicationController
  before_filter :login_required

  def index
    @rooms = Room.find(:all, :order => "updated_at DESC").paginate :page => params[:page]
  end

  def show
    @room = Room.find(params[:id])

    conditions = {:room_id => @room.id}

#    @messages = Message.paginate_by_sql  @room.id, :per_page => 15, :page => params[:page], :order => 'created_at DESC' 


    @messages = Message.paginate_by_sql([  
      "SELECT  messages.*  
        FROM messages  
        WHERE messages.room_id = ?  
        ORDER BY created_at DESC  
      ", @room.id ], :page => params[:page], :per_page => 15 )
    
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

    message = Message.new
    message.room = room
    message.user = @user
    message.contents = "Welcome to my new room, '#{room.title}'.  I'm the moderator here."
    message.save

    message = Message.new
    message.room = room
    message.user = @user
    message.contents = "The topic is:  '#{room.topic}'."
    message.save

    return redirect_to :action => :show, :id => room.id  

  end

end
