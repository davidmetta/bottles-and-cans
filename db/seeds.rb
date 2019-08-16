print "users creating"

User.create(email: 'user1@lewagon.com', password: '123123')
User.create(email: 'user2@lewagon.com', password: '123123')
User.create(email: 'user3@lewagon.com', password: '123123')
User.create(email: 'user4@lewagon.com', password: '123123')


print "users created"



print "pickups creating"

Pickup.create(user_id: 1, longitude: 35.396118, latitude: 33.505654, info: 'beer bottles', bottles: 300, image:'https://source.unsplash.com/user/jackie/likes/200x200')
Pickup.create(user_id: 2, longitude: 34.889427, latitude: 32.442214, info: 'wine bottles', bottles: 200, image: 'https://source.unsplash.com/user/jackie/likes/200x200')
Pickup.create(user_id: 3, longitude: 34.818734, latitude: 32.182232, info: 'milk bottles', bottles: 100, image: 'https://source.unsplash.com/user/jackie/likes/200x200')
Pickup.create(user_id: 4, longitude: 34.713036, latitude: 31.955885, info: 'beer bottles', bottles: 400, image: 'https://source.unsplash.com/user/jackie/likes/200x200')


print "pickups created"
