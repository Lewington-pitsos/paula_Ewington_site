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

  test "create path exists" do
    put '/abouts/1', params: {about: {statement: nil, image: nil, bio: nil}}
    assert_response :success
  end

  test "update changes db info" do
    bio = 'changed'
    statement = 'different caption'
    put "/abouts/#{1}", params: {about: {statement: statement, image: nil, bio: bio}}
    changed_about = About.find(1)
    assert changed_about.statement == statement
    assert changed_about.bio == bio
  end
end
