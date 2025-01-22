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
# Subject.destroy_all

# Create subjects
# puts "Creating subjects..."
# subjects = [
#   { name: 'Mathematics', level: 'Advanced' },
#   { name: 'Physics', level: 'Advanced' },
#   { name: 'Chemistry', level: 'Intermediate' },
#   { name: 'Biology', level: 'Intermediate' },
#   { name: 'English Literature', level: 'Advanced' }
# ].map { |subject| Subject.create!(subject) }

puts "Creating users..."
users = [
  { first_name: "John", last_name: "Jones", email: "johnjones@example.com", password: "password" },
  { first_name: "Amelia", last_name: "Wood", email: "ameliawood@example.com", password: "password1"},
  { first_name: "Helen", last_name: "Wharton", email: "helenwharton@example.com", password: "password2" },
  { first_name: "Fred", last_name: "Bloggs", email: "fredbloggs@example.com", password: "password3" },
  { first_name: "James", last_name: "Pink", email: "jamespink@example.com", password: "password4" },
  { first_name: "Cathy", last_name: "Verrall", email: "cathyverrall@example.com",password: "password5" },
  { first_name: "Gina", last_name: "Jenkin", email: "ginajenkin@example.com", password: "password6" },
  { first_name: "Rachel", last_name: "Shere", email: "rachelshere@example.com", password: "password7" },
  { first_name: "Rob", last_name: "Sandover", email: "robsandover@example.com", password: "password8" },
  { first_name: "Carolyn", last_name: "Ayres", email: "carolynayres@example.com", password: "password9" }
].map do |user_data|
  User.create!(
    user_data.merge(
      ed_level: ['High School', 'Bachelor', 'Master', 'PhD'].sample,
      photo: "https://example.com/photos/#{user_data[:first_name].downcase}#{user_data[:last_name].downcase}.jpg"
    )
  )
end

puts "Creating tutors..."
tutor_users = users.last(5) # Last 5 users will be tutors
tutor_users.each_with_index do |user, index|
  Tutor.create!(
    first_name: user.first_name,
    last_name: user.last_name,
    email: user.email,
    user: user,
    price: 50 + (index * 10), # Unique price for each tutor
    # subject_id: subjects.sample.id, # Randomly assign a subject
    key_stage: ['KS3', 'KS4', 'A-Level'].sample,
    qualification: ['Certified', 'Experienced', 'Expert'].sample
  )
end

puts "Seeding complete! 10 users created, and 5 of them are tutors."
