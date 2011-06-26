require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get login_form" do
    get :login_form
    assert_response :success
  end

  test "should get login_submit" do
    get :login_submit
    assert_response :success
  end

end
