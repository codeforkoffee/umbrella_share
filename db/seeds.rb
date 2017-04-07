# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(
  {
    nickname: 'Caterpillar',
    email: 'jin@gmail.com',
    password: '123123'}
  )

user2 = User.create(
  {
    nickname: 'Mary',
    email: 'mary@gmail.com',
    password: '123123'}
  )

user3 = User.create(
  {
    nickname: 'Jon',
    email: 'jon@gmail.com',
    password: '123123'}
  )

user.save!
user2.save!
user3.save!

user3.owned_umbrellas.create(
  {
    time: Date.current + 5.hours,
    address_1: '431 S Dearborn St',
    address_2: '444 N Wabash St.',
    zipcode: 60605
  })

user3.owned_umbrellas.create(
  {
    time: Date.current + 2.hours,
    address_1: 'Star of Siam',
    address_2: 'Eataly',
    zipcode: 60611
  })

user3.owned_umbrellas.create(
  {
    time: Date.current + 5.hours,
    address_1: 'Union Station',
    address_2: 'Trump International Hotel',
    zipcode: 60611
  })

user3.owned_umbrellas.create(
  {
    time: Date.current + 1.hours,
    address_1: 'Freehand Chicago',
    address_2: 'LA Fitness, East Randolph Street, Chicago, IL',
    zipcode: 60601
  })

user.owned_umbrellas.create(
  {
    time: Date.current + 3.hours,
    address_1: 'Cloud Gate, chicago',
    address_2: 'Barnes & Noble, 1 E Jackson Blvd, Chicago, IL',
    zipcode: 60604
  })

user2.owned_umbrellas.create(
  {
    time: Date.current + 15.hours,
    address_1: 'Jackson, chicago',
    address_2: 'Rainforest Cafe, 605 N Clark St, Chicago, IL 60610',
    zipcode: 60654
  })

user2.owned_umbrellas.create(
  {
    time: Date.current + 1.hours,
    address_1: 'Two Zero Three, Chicago',
    address_2: 'Revival Food Hall, Chicago',
    zipcode: 60603
  })

user.owned_umbrellas.create(
  {
    time: Date.current + 10.hours,
    address_1: 'Tribune Tower, chicago',
    address_2: 'Barnes & Noble, 1 E Jackson Blvd, Chicago, IL',
    zipcode: 60604
  })