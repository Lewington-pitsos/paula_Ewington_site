require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "categories ahs index page" do
    get categories_path
    assert_response :success
  end

  test "show path exists" do
    get category_path(1)
    assert_response :success
  end

  test "new path exists" do
    get new_category_path
    assert_response :success
  end

  test "creating new category updates db" do
    title = 'new'
    post '/categories', params: {category: {title: title, image: nil}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert Category.where(title: title).take
  end

  test 'edit path exists' do
    get edit_category_path(1)
    assert_response :success
  end

  test 'update path saves to db' do
    title = 'changed'
    put '/categories/1', params: {category: {title: title, image: nil}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal title, Category.find(1).title
  end

  test 'update without title causes errors' do
    put '/categories/1', params: {category: {title: nil, image: nil}}
    assert_response :success
    assert flash[:error]
  end

  test 'deleting categories updated db' do
    delete '/categories/1'
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert flash[:success]
    assert_not Category.exists?(1)
  end
end
