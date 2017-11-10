require 'test_helper'

class MiscsControllerTest < ActionDispatch::IntegrationTest
  test "test has font page" do
    get front_path
    assert_response :success
  end
end
