require 'json'

class Car
  attr_accessor :brand, :name, :tires, :motor, :transmission, :doors, :style

  def initialize(brand:, name:, tires:, motor:, transmission:, doors:, style:)
      @brand        = brand
      @name         = name
      @tires        = tires
      @motor        = motor
      @transmission = transmission
      @doors        = doors
      @style        = style
  end

  def to_json
    JSON.generate({
     "brand": @brand,
     "name": @name,
     "tires": @tires,
     "motor": @motor,
     "transmission": @transmission,
     "doors": @doors,
     "style": @style
    })
  end
end

