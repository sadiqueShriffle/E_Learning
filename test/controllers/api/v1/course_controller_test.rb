require "test_helper"

class Api::V1::CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_course_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_course_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_course_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_course_update_url
    assert_response :success
  end

  test "should get destory" do
    get api_v1_course_destory_url
    assert_response :success
  end
end
