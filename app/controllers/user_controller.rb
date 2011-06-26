class UserController < ApplicationController

  def index
    if @user
      return redirect_to :controller => :room, :action => :index
    else
      render :action => :login
    end
  end

  def login
  end

  def login_submit
    handle = params[:handle]
    password = params[:password]

    user = User.find_by_handle(handle)

    if not user
      flash[:error] = "couldn't find a user named: #{handle}"
      return redirect_to :action => :login
    end

    hashed_password = User.hash_password(handle, password)

    if not user.password == hashed_password
      flash[:error] = "wrong password entered for user #{handle}"
      return redirect_to :action => :login
    end

    session[:user_id] = user.id


    return redirect_to :controller => :room, :action => :index

  end

  def logout
    session[:user_id] = nil
    return redirect_to :action => :login
  end

  def register
    @f = params
  end

  def register_submit
    handle = params[:handle]
    password = params[:password]
    email = params[:email]
    phone = params[:phone]

    [:handle, :password, :email, :phone].each { |key|
      if params[key].length < 1
        flash[:error] = "you must provide input for '#{key}'"
        return redirect_to params.merge :action => :register
      end
    }

    if User.find_by_handle(handle)
      flash[:error] = "a user already exists with the handle #{handle}"
      return redirect_to params.merge :action => :register
    end

    if User.find_by_email(email)
      flash[:error] = "a user already exists with the email #{email}"
      return redirect_to params.merge :action => :register
    end

    if User.find_by_phone(phone)
      flash[:error] = "a user already exists with the phone #{phone}"
      return redirect_to params.merge :action => :register
    end

    user = User.new
    user.email = email
    user.phone = phone
    user.handle = handle
    user.password = User.hash_password(handle, password)
    user.save

    session[:user_id] = user.id

    flash[:success] = "successfully registered with handle '#{handle}'"
    return redirect_to :action => :login
  end

end
