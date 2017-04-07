# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat = User.create(
  {
    nickname: 'caterpillar',
    email: 'jin@gmail.com',
    password: '123123'}
  )

dog = User.create(
  {
    nickname: 'mary',
    email: 'mary@gmail.com',
    password: '123123'}
  )
dog.save
cat.save

cat.owned_umbrellas.create(
  {
    time: Date.current + 5.hours,
    address_1: '431 S Dearborn St',
    address_2: '444 N Wabash St.',
    zipcode: 60605
  })

cat.owned_umbrellas.create(
  {
    time: Date.current + 2.hours,
    address_1: 'Star of Siam',
    address_2: 'Eataly',
    zipcode: 60611
  })

cat.owned_umbrellas.create(
  {
    time: Date.current + 5.hours,
    address_1: 'Union Station',
    address_2: 'Trump International Hotel',
    zipcode: 60611
  })

cat.owned_umbrellas.create(
  {
    time: Date.current + 1.hours,
    address_1: 'Freehand Chicago',
    address_2: 'LA Fitness, East Randolph Street, Chicago, IL',
    zipcode: 60601
  })

dog.owned_umbrellas.create(
  {
    time: Date.current + 3.hours,
    address_1: 'Cloud Gate',
    address_2: 'Barnes & Noble, 1 E Jackson Blvd, Chicago, IL',
    zipcode: 60604
  })

cat.owned_umbrellas.create(
  {
    time: Date.current + 3.hours,
    address_1: 'SideDoor, 100 E Ontario St, Chicago, IL',
    address_2: 'Cloud Gate',
    zipcode: 60611
  })

cat.owned_umbrellas.create(
  {
    time: Date.current + 1.hours,
    address_1: 'Jackson, chicago',
    address_2: 'Rainforest Cafe, 605 N Clark St, Chicago, IL 60610',
    zipcode: 60654
  })

cat.owned_umbrellas.create(
  {
    time: Date.current + 1.hours,
    address_1: 'Two Zero Three, Chicago',
    address_2: 'Revival Food Hall, Chicago',
    zipcode: 60603
  })