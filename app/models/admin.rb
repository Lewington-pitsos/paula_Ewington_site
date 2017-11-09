class Admin < ApplicationRecord
  attr_accessor :password

  def authenticated?
    verified_admin = Admin.where(username: self.username).take
    if verified_admin
      salt = verified_admin.salt
      return verified_admin.encrypted_pass == encrypted_password(salt)
    end
    false
  end

  def encrypted_password(salt)
    Digest::SHA1.hexdigest("#{salt}--#{self.password}")
  end

end
