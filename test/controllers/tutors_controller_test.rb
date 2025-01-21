require "test_helper"

class TutorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tutors_index_url
    assert_response :success
  end
end
