require 'test_helper'

class CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get calendars_index_url
    assert_response :success
  end

  test "should get show" do
    get calendars_show_url
    assert_response :success
  end

end
