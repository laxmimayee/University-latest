require 'test_helper'

class StudentControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get prfile" do
    get :prfile
    assert_response :success
  end

  test "should get showmarks" do
    get :showmarks
    assert_response :success
  end

  test "should get comment" do
    get :comment
    assert_response :success
  end

end
