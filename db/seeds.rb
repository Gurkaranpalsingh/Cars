# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.destroy_all
Manufacturer.destroy_all

10.times do
  manufacturer = Manufacturer.create(
    name: Faker::Vehicle.manufacture
  )
  5.times do
    cars = Car.create(
      model: Faker::Vehicle.make,
      description: Faker::Vehicle.standard_specs[0],
      quantity: Faker::Vehicle.engine_size,
      price: Faker::Vehicle.mileage(min: 5_000),
      licenseplate: Faker::Vehicle.license_plate,
      year: Faker::Vehicle.year,
      doorCount: Faker::Vehicle.door_count,
      mileage: Faker::Vehicle.mileage(min: 50_000),
      manufacturer: manufacturer
    )
    query = URI.encode_www_form_component([cars.model, manufacturer.name].join(','))
    download_image = URI.open("https://source.unsplash.com/600x600/?#{query}")
    cars.image.attach(io: download_image, filename: "m-#{[cars.model, manufacturer.name].join('-')}.jpg")

    sleep(1)
  end
end
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
