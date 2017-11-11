require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'has title and is associated with works' do
    cat = Category.first
    assert cat.title
    assert cat.works
    assert cat.works.length > 1
  end

  test "has a place attribute" do
    assert Category.first.position
  end

  test "work only accepts >1 place values" do
    assert Category.new({title: 'blah', image: nil, place: 4}).save
    assert_not Work.new({title: 'blah', image: nil}).save
    assert_not Work.new({title: 'blah', image: nil, place: -4}).save
  end
end
