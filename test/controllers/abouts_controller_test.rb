require 'test_helper'

class AboutsControllerTest < ActionDispatch::IntegrationTest
  test "index exists" do
    get abouts_path
    assert_response :success
  end

  test "edit path exists" do
    get edit_about_path(1)
    assert_response :success
  end
end
