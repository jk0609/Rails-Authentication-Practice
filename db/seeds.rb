# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
Product.destroy_all
User.destroy_all

category_list = [
  'Events',
  'Exhibits',
  'Green Screen',
  'Groups',
  'Portraits'
]

category_list.each do |name|
  new_cat = Category.create(name: name)
  10.times do
    new_cat.products.create(
      name: Faker::Lorem.word,
      description: Faker::Lorem.paragraph,
      price: '%.2f' % (rand * (50-20) + 20)
    )
  end
end

User.create(
  username: 'admin',
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  admin: true
)
