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

  test 'work has edit page' do
    get edit_work_path(1)
    assert_response :success
  end

  test 'works edit page displays current info' do
    get edit_work_path(1)
    assert response.body.match(works(:jeep).title)
  end

  test 'works edits cause changes to changed fields' do
    title = 'changed'
    caption = 'different caption'
    put "/works/#{1}", params: {work: {title: title, image: nil, caption: caption, place: 8}}
    changed_work = Work.find(1)
    assert changed_work.title == title
    assert changed_work.caption == caption
  end

  test "new works have category id" do
    title = 'new work'
    caption = 'caption'
    post category_works_path(2), params: {work: {title: title, image: nil, caption: caption, place: 4}}
    new_work = Work.where(title: 'new work').take
    assert new_work.category_id
    assert_equal 2, new_work.category_id
  end

  test "updated/craeted works reroute to the correct gallery" do
    title = 'new work'
    caption = 'caption'
    post category_works_path(2), params: {work: {title: title, image: nil, caption: caption, place: 4}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert response.body.match(title)
    route = request.path # <<<<<<<<<<<<<<<<<<<<<<<<<<<< getting current path

    new_title = 'new work'
    new_caption = 'caption'
    work_id = Work.where(title: title).take.id
    put "/works/#{work_id}", params: {work: {title: new_title, image: nil, caption: new_caption, place: 3}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert response.body.match(title)
    assert current_page?(route), 'the updated work has been designated a different category'
  end

  test "saving updates place" do
    place = 9
    put "/works/#{1}", params: {work: {title: 'sss', image: nil, caption: 'asdads', place: place}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal place, Work.find(1).position
  end

  test "saving to an already taken place causes place reordering" do
    origional_place = works(:jeep).position
    category = works(:jeep).category_id
    post category_works_path(category), params: {work: {title: 'dddd', image: nil, caption: 'dddd', place: origional_place}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_not_equal origional_place, Work.where(title: 'jeep').take.position
  end

  test "works displayed in order" do
    get category_works_path(works(:jeep3).category_id)
    assert_response :success
  end
end
