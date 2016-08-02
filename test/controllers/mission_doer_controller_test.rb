require 'test_helper'

class MissionDoerControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get mission_doer_create_url
    assert_response :success
  end

  test "should get index" do
    get mission_doer_index_url
    assert_response :success
  end

  test "should get destroy" do
    get mission_doer_destroy_url
    assert_response :success
  end

end
