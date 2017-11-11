require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  test "has a place attribute" do
    assert Work.first.position
  end

  test "work only accepts >1 place values" do
    assert Work.new({title: 'blah', image: nil, caption: 'blah', category_id: 1,  place: 4}).save
    assert_not Work.new({title: 'blah', image: nil, caption: 'blah', category_id: 1, }).save
    assert_not Work.new({title: 'blah', image: nil, caption: 'blah', category_id: 1,  place: -4}).save
  end
end
