# Create 5 test_users
test_users = (1..5).to_a.map do |n|
  User.new(
    email: "test#{n}@example.com",
    password: "testtest"
  )
end

test_users.each do |user|
  user.skip_confirmation!
  user.save

  rand(5..10).times do
    item = user.items.create!(name: Faker::Hipster.sentence)
    item.update_attribute(:created_at, Faker::Date.between(8.days.ago, Date.today))
  end
end


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
