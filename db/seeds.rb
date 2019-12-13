# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
  'General Doctor',
  'Mental Health',
  'Skin',
  'Child Care',
  'Women Health',
  'Dentist',
  'ENT',
  'Homeopathy',
  'Ayurveda',
  'Heart',
]

likes = [100, 200, 300, 400, 500, 600]
exp = [2, 4, 6, 8, 10, 12]

40.times do
  category = categories.sample
  Doctor.create!({
    name: Faker::Name.name,
    category: category,
    description: "#{category} - #{Faker::Company.bs}",
    fee: likes.sample,
    exp: exp.sample,
    likes: likes.sample,
    phone:Faker::PhoneNumber.phone_number,
    address: Faker::Address.full_address,
    image: Faker::Avatar.image
  })
end 
