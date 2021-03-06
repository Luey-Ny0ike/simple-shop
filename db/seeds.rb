# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
  User.create(
    email: "test#{ i+1 }@test.com",
    password: 1234567,
    password_confirmation: 1234567,
    confirmed_at: DateTime.now
  )
end

4.times do |i|
  Region.create(title: "Region #{ i+1 }", country_details: "country details here", tax_details: "tax details here", currency_details: "currency_details here" )
end

10.times do |i|
  Product.create(
    title: "product #{ i+1}",
    description: "description here",
    price: rand(200..2000),
    sku: rand(36**7).to_s(36),
    stock_number: rand(0..55),
    region: Region.all.sample
  )
end

5.times do |i|
  Order.create(
    full_name: "Test user #{ i+1 }",
    email: "test#{ i+1 }@test.com",
    customer: Customer.all.sample
  )
end
