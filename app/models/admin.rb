class Admin < ApplicationRecord
  attr_accessor :password, :raw_token

  def authenticated?
    verified_admin = get_verified_admin(self.username)
    if verified_admin
      salt = verified_admin.salt
      return verified_admin.encrypted_pass == encrypted(salt)
    end
    false
  end

  def encrypted(salt, value = self.password)
    Digest::SHA1.hexdigest("#{salt}--#{value}")
  end

  def store_new_token
    self.raw_token = SecureRandom.urlsafe_base64
    encrypted_token = self.encrypted(self.salt, raw_token)
    admin = get_verified_admin(self.username)
    admin.update_attribute :encrypted_token, encrypted_token
  end

  def get_verified_admin(username)
    Admin.where(username: username).take
  end

end
