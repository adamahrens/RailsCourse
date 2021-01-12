require 'faker'

# Create 20 random courses
20.times do 
    Track.create!(title: Faker::Educator.course_name, description: "<p>#{Faker::Movies::Ghostbusters.quote}</p>")
end