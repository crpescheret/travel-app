5.times do
  Comment.create(
                  :trip_id => 1,
                  :user_id => 2,
                  :text => Faker::Hipster.word
                  )
end