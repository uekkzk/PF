require 'test_helper'

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get show_edit_url
    assert_response :success
  end

  test "should get update" do
    get show_update_url
    assert_response :success
  end

  test "should get unsubscribe" do
    get show_unsubscribe_url
    assert_response :success
  end

  test "should get is_active" do
    get show_is_active_url
    assert_response :success
  end

end
