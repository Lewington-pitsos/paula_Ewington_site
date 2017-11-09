require 'test_helper'

class MiscsControllerTest < ActionDispatch::IntegrationTest
  test 'about the artist path exists' do
    get about_path
    assert_response :success
    assert response.body.match('About')
  end
end
