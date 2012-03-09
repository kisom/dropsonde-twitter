require 'test_helper'

class TwitterControllerTest < ActionController::TestCase
  test "should get auth" do
    get :auth
    assert_response :success
  end

  test "should get receive" do
    get :receive
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

end
