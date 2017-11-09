require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "admin link exists" do
    get works_path
    assert response.body.match('Admin')
  end

  test "admin sign in rout exists" do
    get new_admin_path
    assert_response :success
    assert_select 'form'
  end

  test "admin can sign in" do
    add_admin
    post '/admins', params: {admin: {username: 'paula', password: 'colston'}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "incorrect admin sign ins fail" do
    add_admin
    post '/admins', params: {admin: {username: 'paul', password: 'colston'}}
    assert_response :success
    assert flash[:error]

    post '/admins', params: {admin: {username: 'paula', password: 'col'}}
    assert_response :success
    assert flash[:error]
  end
end
