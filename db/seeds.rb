password = 'colston'

salt = Digest::SHA1.hexdigest("#{password}--#{Time.now} as random value")

e_pass = Digest::SHA1.hexdigest("#{salt}--#{password}")

admin = Admin.new({
    username: 'paula',
    encrypted_pass: e_pass,
    salt: salt
  })

admin.save

work1 = Work.new({title: 'art1', image: nil})
work2 = Work.new({title: 'art2', image: nil})
work3 = Work.new({title: 'art3', image: nil})

work1.save
work2.save
work3.save
