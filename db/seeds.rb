password = 'colston'

salt = Digest::SHA1.hexdigest("#{password}--#{Time.now} as random value")

e_pass = Digest::SHA1.hexdigest("#{salt}--#{password}")

admin = Admin.new({
    username: 'paula',
    encrypted_pass: e_pass,
    salt: salt
  })

admin.save
