require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest

  setup do
    add_admin
  end

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
    post '/admins', params: {admin: {username: 'paula', password: 'colston'}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test "incorrect admin sign ins fail" do
    post '/admins', params: {admin: {username: 'paul', password: 'colston'}}
    assert_response :success
    assert flash[:error]

    post '/admins', params: {admin: {username: 'paula', password: 'col'}}
    assert_response :success
    assert flash[:error]
  end

  test "admin sign in recorded in session" do
    post '/admins', params: {admin: {username: 'paula', password: 'colston'}}
    assert session[:admin]
  end

  test "admin sign out recorded in session" do
    post '/admins', params: {admin: {username: 'paula', password: 'colston'}}
    delete '/admins/paula'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_not session[:admin]
  end

  test "admin actions cause visible flashes" do
    post '/admins', params: {admin: {username: 'paula', password: 'colston'}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select '.flash'

    delete '/admins/paula'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select '.flash'

    post '/admins', params: {admin: {username: 'p', password: 'colston'}}
    assert_select '.flash'
  end
end
