# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# db/seeds.rb

puts "Clearing existing data..."
Favourite.destroy_all
Booking.destroy_all
Tutor.destroy_all
User.destroy_all
Subject.destroy_all

puts "Creating subjects..."

subjects = [
 "English",
 "Maths",
 "Science",
 "Geography",
 "History",
 "Art",
 "Music",
 "Design and Technology",
 "Computing",
 "Modern Foreign Languages",
 "Religious Education"
].map { |subject_name| Subject.create(name: subject_name) }

puts "Creating users..."

user_data_list = [
 {
   first_name: "Emma",
   last_name: "Thompson",
   email: "emma.thompson@example.com",
   password: "password123",
   ed_level: "Bachelor",
   photo: "https://example.com/photos/emmathompson.jpg"
 },
 {
   first_name: "Jack",
   last_name: "Davies",
   email: "jack.davies@example.com",
   password: "password123",
   ed_level: "High School",
   photo: "https://example.com/photos/jackdavies.jpg"
 },
 {
   first_name: "Olivia",
   last_name: "Brown",
   email: "olivia.brown@example.com",
   password: "password123",
   ed_level: "Master",
   photo: "https://example.com/photos/oliviabrown.jpg"
 },
 {
   first_name: "Harry",
   last_name: "Wilson",
   email: "harry.wilson@example.com",
   password: "password123",
   ed_level: "PhD",
   photo: "https://example.com/photos/harrywilson.jpg"
 },
 {
   first_name: "Sophie",
   last_name: "Moore",
   email: "sophie.moore@example.com",
   password: "password123",
   ed_level: "Bachelor",
   photo: "https://example.com/photos/sophiemoore.jpg"
 },
 {
   first_name: "Daniel",
   last_name: "Taylor",
   email: "daniel.taylor@example.com",
   password: "password123",
   ed_level: "High School",
   photo: "https://example.com/photos/danieltaylor.jpg"
 },
 {
   first_name: "Emily",
   last_name: "Clark",
   email: "emily.clark@example.com",
   password: "password123",
   ed_level: "Master",
   photo: "https://example.com/photos/emilyclark.jpg"
 },
 {
   first_name: "Michael",
   last_name: "Roberts",
   email: "michael.roberts@example.com",
   password: "password123",
   ed_level: "PhD",
   photo: "https://example.com/photos/michaelroberts.jpg"
 },
 {
   first_name: "Jessica",
   last_name: "Walker",
   email: "jessica.walker@example.com",
   password: "password123",
   ed_level: "Bachelor",
   photo: "https://example.com/photos/jessicawalker.jpg"
 },
 {
   first_name: "David",
   last_name: "Green",
   email: "david.green@example.com",
   password: "password123",
   ed_level: "High School",
   photo: "https://example.com/photos/davidgreen.jpg"
 }
]

users = user_data_list.map { |user_data| User.create!(user_data) }

puts "Creating tutors..."

tutor_users = users.last(5)  # Select the last 5 users for creating tutors

tutor_users.each_with_index do |user, index|
  tutor = Tutor.create!(
    first_name: user.first_name,
    last_name: user.last_name,
    email: user.email,
    user: user,
    price: 50 + (index * 10),
    key_stage: ['2', '3', '4'].sample,
    qualification: ['Degree', 'Masters', 'PhD'].sample
  )

  # Assign 2-3 random subjects to each tutor
  2.upto(3) do
    tutor.subjects << subjects.sample
  end
end

puts "Seeding complete! 10 users created, and 5 of them are tutors with assigned subjects."
