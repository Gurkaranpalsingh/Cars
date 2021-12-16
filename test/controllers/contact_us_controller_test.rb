require "test_helper"

class ContactUsControllerTest < ActionDispatch::IntegrationTest
  test "should get permalink" do
    get contact_us_permalink_url
    assert_response :success
  end
end
