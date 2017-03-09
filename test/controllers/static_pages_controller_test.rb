require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get privacy" do
    get :privacy
    assert_response :success
  end

  test "should get term" do
    get :term
    assert_response :success
  end

end
