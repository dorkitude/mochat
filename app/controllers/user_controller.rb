class UserController < ApplicationController

  def index
    if @user
      render :controller => :room, :action => :index
    else
      render :action => :login
    end
  end

  def login
  end

  def login_submit
  end

  def logout
  end

  def register
  end

  def register_submit
  end

end
