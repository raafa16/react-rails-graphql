# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Company.destroy_all

10.times do
  Company.create(
    name: Faker::Company.name
  )
end

companies = Company.all

companies.each do |c|
  10.times do
    c.customers.create(
      name: Faker::Name.name,
      email: Faker::Internet.email
    )
  end
end

customers = Customer.all

customers.each do |cust|
  cust.addresses.create(
    city: Faker::Address.city,
    street: Faker::Address.street_address,
    zip_code: Faker::Address.zip_code
  )
end
