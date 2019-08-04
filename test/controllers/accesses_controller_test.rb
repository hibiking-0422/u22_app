require 'test_helper'

class AccessesControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get accesses_hello_url
    assert_response :success
  end

  test "should get goodbye" do
    get accesses_goodbye_url
    assert_response :success
  end

end
