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

users = [
  # ... user data ...
].map do |user_data|
  User.create!(
    user_data.merge(
      ed_level: ['High School', 'Bachelor', 'Master', 'PhD'].sample,
      photo: "https://example.com/photos/#{user_data[:first_name].downcase}#{user_data[:last_name].downcase}.jpg"
    )
  )
end

puts "Creating tutors..."
tutor_users = users.last(5)

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

  2.upto(3) do |i|
    tutor.subjects << subjects.sample
  end
end

puts "Seeding complete! 10 users created, and 5 of them are tutors with assigned subjects."
