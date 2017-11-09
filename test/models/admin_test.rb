require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test "at least one admin exists after seeding" do
    add_admin
    assert Admin.first
  end
end
