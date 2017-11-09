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
    token = admin.encrypted_token
    admin.store_new_token
    assert token != Admin.first.encrypted_token
  end

  test "can check for matching tokens" do
    admin = Admin.first
    assert admin.tokens_match 'qqq'
    assert_not admin.tokens_match 'ppp'
  end
end
