require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'has title and is associated with works' do
    cat = Category.first
    assert cat.title
    assert cat.works
  end
end
