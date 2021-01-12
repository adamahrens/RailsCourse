require 'faker'

users = []
5.times do
    users << User.create!(email: Faker::Internet.email, password: 'password123', password_confirmation: 'password123') 
end

# Create 20 random courses
20.times do 
    Track.create!(title: Faker::Educator.course_name, description: "<p>#{Faker::Movies::Ghostbusters.quote}</p>", user: users.sample)
end