10.times do
  Accommodation.create(
                :trip_id => 3,
                :name => Faker::Company.name,
                :price => Faker::Number.number(3),
                :address => Faker::Address.street_address,
                :url => Faker::Internet.url,
                :property_type => Faker::Hipster.word
                )
end