password = 'colston'

salt = Digest::SHA1.hexdigest("#{password}--#{Time.now} as random value")

e_pass = Digest::SHA1.hexdigest("#{salt}--#{password}")

admin = Admin.new({
    username: 'paula',
    encrypted_pass: e_pass,
    salt: salt
  })

admin.save

work1 = Work.new({title: 'art1', image: nil, caption: 'erving first as navy minister and then as agriculture minister; the first professional firefighter corps in Brazil was formed during his tenure. In late 1866 he was appointed commander-in-chief of the fleet engaged in the Paraguayan War, and achieved the rank of admiral. Although historical works have not given much coverage to Inhaúma, some historians regard him among the greatest of the Brazilian navy officers. (Full article...)'})
work2 = Work.new({title: 'art2', image: nil, caption: 'Mohammad bin Salman (pictured), more than 40 senior Saudi princes and ministers are arrested on corruption charges.'})
work3 = Work.new({title: 'art3', image: nil, caption: 'civilians destroyed and ransacked Jewish homes, businesses and synagogues in Germany and Austria, resulting in at least 90 deaths and the deportation of over 30,000 others to concentration camps.'})

work1.save
work2.save
work3.save
