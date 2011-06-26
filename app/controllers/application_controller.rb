class ApplicationController < ActionController::Base
  # commenting out because i don't think we want this, since not all forms are generated -KW
  # protect_from_forgery
  
  # this will give views access to the action and controller name
  before_filter :instantiate_controller_and_action_names

  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end

  # this will give views access to the user
  before_filter :instantiate_user

  def instantiate_user
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      @user = nil
    end
  end

  # this filter is to be used by specific controllers
  def login_required
    if session[:user_id]
      return true
    end

    flash[:error] = "gotta login first mang."
    return redirect_to :controller => :user, :action => :login
  end

end
