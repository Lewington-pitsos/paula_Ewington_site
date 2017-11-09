require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  test "root requests load works index" do
    get '/'
    assert_response :success
    assert response.body.match("Welcome")
  end

  test "work has index, new, show and delete" do
    get works_path
    assert_response :success

    get new_work_path
    assert_response :success
    
    get work_path(Work.first.id)
    assert_response :success

    # delete work_path
    # assert_response :redirect
    # follow_redirect!
    # assert_response :success
  end
end
