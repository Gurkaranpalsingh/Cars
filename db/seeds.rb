# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Car.destroy_all
Manufacturer.destroy_all
Province.destroy_all
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

Province.create({ name: 'Manitoba', GST: '5', PST: '7', HST: '0' })
Province.create({ name: 'Alberta', GST: '5', PST: '0', HST: '0' })
Province.create({ name: 'British Columbia', GST: '5', PST: '7', HST: '0' })
Province.create({ name: 'New Brunswick', GST: '0', PST: '0', HST: '15' })
Province.create({ name: 'New Foundland and Labrador', GST: '0', PST: '0', HST: '15' })
Province.create({ name: 'NorthWest Territories', GST: '5', PST: '0', HST: '0' })
Province.create({ name: 'NovaScotia', GST: '0', PST: '0', HST: '15' })
Province.create({ name: 'Nunavut', GST: '5', PST: '0', HST: '0' })
Province.create({ name: 'Ontario', GST: '0', PST: '0', HST: '13' })
Province.create({ name: 'Prince Edward Island', GST: '0', PST: '0', HST: '15' })
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
