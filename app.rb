require 'car_factory'

include CarFactory

# Database connection
Database.load(db_file: 'db.yml')


def calcular_auto(inventarioDict, car) 

  #Gettin tires
  available_tires = 0
  case car.tires
  when "Continental"
    available_tires = inventarioDict[:cont_tires]
  when "Michelin"
    available_tires = inventarioDict[:mich_tires]
  end

  #Gettin motor
  available_motor = 0
  case car.motor
  when "Non Turbo 2.0"
    available_motor = inventarioDict[:nonturb_motor]
  when "Turbo 2.5"
    available_motor = inventarioDict[:turb_motor]
  end

  #Gettin transmision
  available_transmission = 0
  case car.transmission
  when "Automatic"
    available_transmission = inventarioDict[:automatic_transmissions]
  when "Manual"
    available_transmission = inventarioDict[:manual_transmissions]
  end

  #Gettin doors
  door_cost = car.doors
  available_doors = inventarioDict[:doors]

  

  result = 0
  while true do
    break if available_tires < 4
    break if available_transmission < 1
    break if available_motor < 1
    break if available_doors < door_cost
    result +=1

    

    available_tires -= 4
    available_transmission -= 1
    available_motor -= 1
    available_doors -= door_cost

  end

  return result

end

# Which fields are available
inv_dict = {
  cont_tires: Inventory.continental_tires,
  mich_tires: Inventory.michelin_tires,
  nonturb_motor: Inventory.motors_with_no_turbo,
  turb_motor: Inventory.motors_with_turbo,
  automatic_transmissions: Inventory.automatic_transmissions,
  manual_transmissions: Inventory.manual_transmissions,
  doors: Inventory.doors



}
# puts cont_tires = Inventory.continental_tires
# puts mich_tires = Inventory.michelin_tires
# puts motor_turbo = Inventory.motors_with_turbo
# puts motor_no_turbo = Inventory.motors_with_no_turbo
# puts doors = Inventory.doors
# puts manual_trans = Inventory.manual_transmissions
# puts autom_trans = Inventory.automatic_transmissions

# car 1
car1 = Car.new(
    brand:        "Mazda",
    name:         "Mazda6",
    tires:        "Michelin",
    motor:        "Turbo 2.5",
    transmission: "Manual",
    doors:        4,
    style:        "Sedan"
  )  
max_number_cars1 = calcular_auto(inv_dict, car1)

carArray1 = Array.new(max_number_cars1,car1) 

# TODO


# Post result to validator
result1 = Transport.post_result(
  team:       2,
  total:      carArray1.length,
  cars:       carArray1
)


# car 2
car2 = Car.new(
    brand:        "Mazda",
    name:         "Mazda3",
    tires:        "Continental",
    motor:        "Non Turbo 2.0",
    transmission: "Automatic",
    doors:        3,
    style:        "Hashback"
  )  
max_number_cars2 = calcular_auto(inv_dict, car2)
carArray2 = Array.new(max_number_cars2,car2) 

# Post result to validator
result2 = Transport.post_result(  
  team:       2,
  total:      carArray2.length,
  cars:       carArray2
)


puts "RESULTADOS: -------------------"

puts result1.body.inspect
puts result2.body.inspect