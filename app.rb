require 'car_factory'

include CarFactory

# Database connection
Database.load(db_file: 'db.yml')

puts Inventory.continental_tires
puts Inventory.michelin_tires
puts Inventory.motors_with_turbo
puts Inventory.motors_with_no_turbo
puts Inventory.doors
puts Inventory.manual_transmissions
puts Inventory.automatic_transmissions

