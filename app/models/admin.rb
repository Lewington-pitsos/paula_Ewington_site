class Admin < ApplicationRecord
  attr_accessor :password, :raw_token, :stay_signed_in

  def authenticated?
    verified_admin = get_verified_admin(self.username)
    if verified_admin
      self.salt = verified_admin.salt
      return verified_admin.encrypted_pass == encrypted
    end
    false
  end

  def encrypted(value = self.password)
    Digest::SHA1.hexdigest("#{self.salt}--#{value}")
  end

  def store_new_token
    self.raw_token = SecureRandom.urlsafe_base64
    encrypted_token = self.encrypted(raw_token)
    admin = get_verified_admin(self.username)
    admin.update_attribute :encrypted_token, encrypted_token
  end

  def get_verified_admin(username)
    Admin.where(username: username).take
  end

  def tokens_match(token)
    self.encrypted_token == encrypted(token)
  end

end
