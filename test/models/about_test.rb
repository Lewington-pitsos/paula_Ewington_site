require 'test_helper'

class AboutTest < ActiveSupport::TestCase
  test 'about has text and image' do
    about = About.new({image: nil, statement: 'I am a artist', bio: 'born at some point'})
    about.save
    saved_about = About.last
    assert_equal saved_about.statement, 'I am a artist'
    assert_equal saved_about.bio, 'born at some point'
  end
end
