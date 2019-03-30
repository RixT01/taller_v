require 'car_factory'

include CarFactory

# Database connection
Database.load(db_file: 'db.yml')

# Which fields are available
puts cont_tires = Inventory.continental_tires
puts mich_tires = Inventory.michelin_tires
puts motor_turbo = Inventory.motors_with_turbo
puts motor_no_turbo = Inventory.motors_with_no_turbo
puts doors = Inventory.doors
puts manual_trans = Inventory.manual_transmissions
puts autom_trans = Inventory.automatic_transmissions

carArray = []

#car 2
while true do
  break if cont_tires < 4
  break if motor_no_turbo < 1
  break if autom_trans < 1
  break if doors < 3
  
  car = Car.new(
    brand:        "Mazda",
    name:         "Mazda3",
    tires:        "Continental",
    motor:        "Non Turbo 2.0",
    transmission: "Automatic",
    doors:        3,
    style:        "Hashback"
  )  
  carArray.prepend(car)

  cont_tires -= 4
  motor_no_turbo -= 1
  autom_trans -= 1
  doors -= 3

end

# Post result to validator
result1 = Transport.post_result(
  team:       2,
  total:      carArray.length,
  cars:       carArray
)

carArray = []
cont_tires = Inventory.continental_tires
mich_tires = Inventory.michelin_tires
motor_turbo = Inventory.motors_with_turbo
motor_no_turbo = Inventory.motors_with_no_turbo
doors = Inventory.doors
manual_trans = Inventory.manual_transmissions
autom_trans = Inventory.automatic_transmissions


# car 1
while true do
  break if mich_tires < 4
  break if motor_turbo < 1
  break if manual_trans < 1
  break if doors < 4
  
  car = Car.new(
    brand:        "Mazda",
    name:         "Mazda6",
    tires:        "Michelin",
    motor:        "Turbo 2.5",
    transmission: "Manual",
    doors:        4,
    style:        "Sedan"
  )  
  carArray.prepend(car)

  mich_tires -= 4
  motor_turbo -= 1
  manual_trans -= 1
  doors -= 4

end


# Post result to validator
result2 = Transport.post_result(  
  team:       2,
  total:      carArray.length,
  cars:       carArray
)


puts "RESULTADOS: -------------------"

puts result1.body.inspect
puts result2.body.inspect