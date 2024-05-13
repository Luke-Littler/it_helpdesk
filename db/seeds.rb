# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'faker'

# Create problems
problem_types = [0, 1, 2, 3]
problem_sub_types = [0, 1, 2, 3]
status = [0, 1, 2]
n = 1

# Create specialists
Specialist.create!(
        name: "Unassigned",
        phone: "nil",
        email: "nil",
        specialist_type: nil,
        specialist_sub_type: nil,
    )

# Create operators
50.times do |i|
    Operator.create!(
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
    )
    end
    puts "Operators Created"

1000.times do |i|
    Problem.create!(
        problem_type: problem_types.sample,
        problem_sub_type: problem_sub_types.sample,
        status: status.sample,
    )
    end
    puts "Problems Created"

# Create equipment
200.times do |i|
    Equipment.create!(
        serial_number: Faker::DrivingLicence.british_driving_licence,
        make: Faker::Device.manufacturer,
        model: Faker::Device.model_name,
        operating_system: Faker::Device.platform,
    )
    end
    puts "Equipment Created"

# Create software_products
status = [0, 1]
100.times do |i|
    SoftwareProduct.create!(
        name: Faker::App.name,
        status: status.sample,
        licence_number: Faker::DrivingLicence.british_driving_licence,
        licence_exp_date: Faker::Date.between(from: 2.days.ago, to: 1.year.from_now),
    )
    end
    puts "Software Created"
    
50.times do |i|
    Specialist.create!(
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        specialist_type: problem_types.sample,
        specialist_sub_type: problem_sub_types.sample,
    )
    end
    puts "Specialists Created"

# Create users
1000.times do |i|
    User.create!(
        name: Faker::Name.name,
        phone: Faker::PhoneNumber.cell_phone,
        email: Faker::Internet.email,
        job_title: Faker::Job.title,
        department: Faker::Job.field,
    )
    end
    puts "Users Created"

    # Create notes
1000.times do |i|
    PolyNote.create!(
        note: Faker::Lorem.sentence,
        notable_type: "Problem",
        notable_id: n,
        user_id: User.all.sample.id,
        operator_id: nil,
        specialist_id: nil,
    )
    PolyNote.create!(
        note: Faker::Lorem.sentence,
        notable_type: "Problem",
        notable_id: n,
        user_id: nil,
        operator_id: Operator.all.sample.id,
        specialist_id: nil,
    )
    PolyNote.create!(
        note: Faker::Lorem.sentence,
        notable_type: "Problem",
        notable_id: n,
        user_id: nil,
        operator_id: nil,
        specialist_id: Specialist.all.sample.id,
    )
    n += 1
    end
    puts "Poly Notes Created"

    # Add user_id to problems
    Problem.all.each do |problem|
        problem.update(user_id: User.all.sample.id)
    end
    puts "User_id added to problems"

    # Add operator_id to problems
    Problem.all.each do |problem|
        problem.update(operator_id: Operator.all.sample.id)
    end
    puts "Operator_id added to problems"

    # Add equipment_id to problems
    Problem.all.each do |problem|
        problem.update(equipment_id: Equipment.all.sample.id)
    end
    puts "Equipment_id added to problems"

    # Add equipment_id and software_product_id to equipment_software_products
   1000.times do |i|
    EquipmentSoftwareProduct.create!(
        equipment_id: Equipment.all.sample.id,
        software_product_id: SoftwareProduct.all.sample.id,
    )
    end
    puts "Equipment_id & Software_product_id added to equipment_software_products"

    # Add problem_id and specialist_id to problems_specialists
    n = 1
    1000.times do |i|
    ProblemsSpecialists.create!(
        problem_id: n,
        specialist_id: 1,
    )
    n += 1
    end
    puts "Problem_id & Specialist_id added to problem_specialists"

    Problem.all.each do |problem|
        problem.update(specialist_id: 1)
    end
    puts "Specialist_id added to problems"

    type = 0
    ProblemsSpecialists.where(specialist_id: 1).each do |ps|
        problem = Problem.find(ps.problem_id)
        if problem.problem_type == type && problem.problem_sub_type == type
            ps.update(specialist_id: Specialist.where(specialist_type: type, specialist_sub_type: type).sample.id)
        elsif problem.specialist.nil?
            problem.update(specialist_id: Specialist.where(specialist_type: problem.problem_type).sample.id)
        end
        type += 1
    end

    puts "Specialist_types added to problems"

    Account.create!(
        email: "luke@admin.com",
        password: "littler",
        password_confirmation: "littler",
        role: "admin",
    )

    puts "Admin Account Created"

    puts "Database Seed Completed"





