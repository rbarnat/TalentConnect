require 'test_helper'

class AppointmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get appointment_index_url
    assert_response :success
  end

  test "should get new" do
    get appointment_new_url
    assert_response :success
  end

  test "should get create" do
    get appointment_create_url
    assert_response :success
  end

  test "should get destroy" do
    get appointment_destroy_url
    assert_response :success
  end

end
