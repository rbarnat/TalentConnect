require 'faker'
require 'activerecord-reset-pk-sequence'

ActiveRecord::Base.connection.disable_referential_integrity do
  Place.delete_all
  Place.reset_pk_sequence
  User.delete_all
  User.reset_pk_sequence
  Talent.delete_all
  Talent.reset_pk_sequence
  Appointment.delete_all
  Appointment.reset_pk_sequence
  puts 'DB cleaned up !'
end


# --- PLACES ---
cities = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Bordeaux", "Montpellier", "Rennes", "Grenoble", "Rouen", "Amiens", "Metz", "Brest" ]

20.times do
  Place.create(
      city_name: cities.sample,
      zip_code: Faker::Address.zip_code,
      address: Faker::Address.street_address
  )
end

puts "#{Place.count} places created"



# --- USERS ---
10.times do
    User.create(
      email: Faker::Internet.unique.email(domain: 'yopmail.com'),
      password: Faker::Internet.password(min_length: 6, max_length: 20),
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.cell_phone_in_e164,
      place_id: Faker::Number.between(from: 1, to: 10)
    )
  end
  puts "#{User.count} users created"



# --- TALENTS ---
20.times do
    Talent.create(
      user_id: Faker::Number.between(from: 1, to: 10),
      title: Faker::Lorem.word,
      description: Faker::Lorem.paragraph(sentence_count: 2),
      duration: Faker::Number.between(from: 15, to: 240),  
      place_id: Faker::Number.between(from: 1, to: 10)
    )
end
puts "#{Talent.count} talents created"



# --- APPOINTMENTS ---
50.times do
    Appointment.create(
        mentor_id: Faker::Number.between(from: 1, to: 10),
        apprentice_id: Faker::Number.between(from: 1, to: 10),
        place_id: Faker::Number.between(from: 1, to: 10),
        talent_id: Faker::Number.between(from: 1, to: 10),
        start_time: Faker::Date.between(from: '2020-12-01', to: '2021-03-26')
        
    )
end
puts "#{Appointment.count} appointments created"

