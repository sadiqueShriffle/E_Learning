require "test_helper"

class PracticeQuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get practice_question_show_url
    assert_response :success
  end

  test "should get index" do
    get practice_question_index_url
    assert_response :success
  end

  test "should get create" do
    get practice_question_create_url
    assert_response :success
  end

  test "should get update" do
    get practice_question_update_url
    assert_response :success
  end

  test "should get destroy" do
    get practice_question_destroy_url
    assert_response :success
  end
end
