require 'test_helper'

class AboutTest < ActiveSupport::TestCase
  test 'about has text and image' do
    about = About.new({image: nil, statement: 'I am a artist', bio: 'born at some point'})
    about.save
    saved_about = About.first
    assert_equal About.last.statement, 'I am a artist'
    assert_equal About.last.statement, 'born at some point'
  end
end
