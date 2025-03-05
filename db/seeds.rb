# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seeding instructors
instructors = Instructor.create!([
  { first_name: "John", last_name: "Doe", department: "Computer Science", email: "jdoe@example.com" },
  { first_name: "Jane", last_name: "Smith", department: "Mathematics", email: "jsmith@example.com" },
  { first_name: "Alice", last_name: "Johnson", department: "Physics", email: "ajohnson@example.com" }
])

# Seeding courses
Course.create!([
  { title: "Introduction to Programming", subject: "Computer Science", course_number: 101, description: "Learn the basics of programming with Ruby.", credits: 3 },
  { title: "Calculus I", subject: "Mathematics", course_number: 201, description: "An introduction to differential calculus.", credits: 4 },
  { title: "Physics for Engineers", subject: "Physics", course_number: 301, description: "Fundamental physics concepts for engineering students.", credits: 3 }
])

puts "Seed data successfully added!"
