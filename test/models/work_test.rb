require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  test "has a place attribute" do
    assert Work.first.place
  end
end
