require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "categories ahs index page" do
    get categories_path
    assert_response :success
  end

  test "show path" do
    get category_path(1)
    assert_response :success
  end

end
