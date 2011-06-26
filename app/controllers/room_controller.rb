class RoomController < ApplicationController

  def index
    @rooms = Room.find(:all, :order => "updated_at DESC").paginate :page => params[:page]
  end

  def show
  end

  def new
  end

  def create
  end

end
