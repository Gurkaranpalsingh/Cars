require "test_helper"

class CarSearchControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get car_search_index_url
    assert_response :success
  end
end
