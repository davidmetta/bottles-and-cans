print "users creating"

streets = %w[frishman dizengoff bograshov allenby hayarkon mapu malan arlozorov jabotinski zvulun]
20.times do
  user = User.new(email: Faker::Internet.email, password: '123123')
  user.save
  if user.persisted?
    2.times do
      pickup = Pickup.new(user: user, bottles: rand(10..50), location: "#{streets.sample} #{rand(1..50)}, Tel aviv", info: "floor #{rand(1..5)}")
      pickup.save
    end
  end
end

