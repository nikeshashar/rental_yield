Property.destroy_all
User.destroy_all

nikesh = User.create(email: "nikesh@email.com", password: 'testtest', password_confirmation: "testtest")
chloe = User.create(email: "chloe@email.com", password: 'testtest', password_confirmation: "testtest")
toan = User.create(email: "toan@email.com", password: 'testtest', password_confirmation: "testtest")
jean = User.create(email: "jean@email.com", password: 'testtest', password_confirmation: "testtest")
alex = User.create(email: "alex@email.com", password: 'testtest', password_confirmation: "testtest")

property = nikesh.properties.create(postcode: "EC1Y 1AA", rent: '1000', cost: 200000)
property = chloe.properties.create(postcode: "EC1Y 1AB", rent: '1100', cost: 210000)
property = toan.properties.create(postcode: "EC1Y 1AC", rent: '1200', cost: 220000)
property = jean.properties.create(postcode: "EC1Y 1AD", rent: '1300', cost: 230000)
property = alex.properties.create(postcode: "EC1Y 1AE", rent: '1400', cost: 240000)