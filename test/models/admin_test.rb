require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  setup do
    add_admin
  end

  test "at least one admin exists after seeding" do
    assert Admin.first
  end

  test "can save a token to db" do
    admin = Admin.first
    admin.store_new_token
    token = admin.encrypted_token
    assert token == Admin.first.encrypted_token
  end
end
