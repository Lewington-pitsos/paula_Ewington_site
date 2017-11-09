require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

module AdminHelper
  def add_admin
    # code copied straigth accross from seed file
    password = 'colston'

    salt = Digest::SHA1.hexdigest("#{password}--#{Time.now} as random value")

    e_pass = Digest::SHA1.hexdigest("#{salt}--#{password}")

    token = Digest::SHA1.hexdigest("#{salt}--#{'qqq'}")

    admin = Admin.new({
        username: 'paula',
        encrypted_pass: e_pass,
        salt: salt,
        encrypted_token: token
      })

    admin.save
    # -------------------------------
  end
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include AdminHelper


  # Add more helper methods to be used by all tests here...
end
