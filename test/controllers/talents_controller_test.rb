require 'test_helper'

class TalentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get talents_index_url
    assert_response :success
  end

  test "should get show" do
    get talents_show_url
    assert_response :success
  end

  test "should get new" do
    get talents_new_url
    assert_response :success
  end

  test "should get create" do
    get talents_create_url
    assert_response :success
  end

  test "should get edit" do
    get talents_edit_url
    assert_response :success
  end

  test "should get update" do
    get talents_update_url
    assert_response :success
  end

  test "should get destroy" do
    get talents_destroy_url
    assert_response :success
  end

end
