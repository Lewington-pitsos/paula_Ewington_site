require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "categories ahs index page" do
    get categories_path
    assert_response :success
  end
end
