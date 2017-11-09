require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  include ActionView::Helpers::UrlHelper
  test "root requests load works front_page" do
    get '/'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert current_page?(front_path)
    assert response.body.match("Welcome")
  end

  test "work has new, show and delete" do
    get new_category_works_path(1)
    assert_response :success

    get work_path(Work.first.id)
    assert_response :success

    delete work_path(Work.first.id)
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end
end
