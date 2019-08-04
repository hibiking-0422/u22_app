require 'test_helper'

class UnkoesControllerTest < ActionDispatch::IntegrationTest
  test "should get unko" do
    get unkoes_unko_url
    assert_response :success
  end

end
