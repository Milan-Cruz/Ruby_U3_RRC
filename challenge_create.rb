require_relative "ar.rb"

# 1. Create a Baseball Bat product using `new` and `save`.
baseball_bat = Product.new(name: "Baseball Bat", description: "Wooden baseball bat, 34 inches", price: 25.99, stock_quantity: 10, category_id: 8)
baseball_bat.save

# 2. Create a Car Rear View Mirror product using `create` (which combines `new` and `save`).
car_mirror = Product.create(name: "Car Rear View Mirror", description: "Center rearview mirror, standard size", price: 50.00, stock_quantity: 5, category_id: 8)

# 3. Create a Pepper Spray product using `new` and `save!`.
pepper_spray = Product.new(name: "Pepper Spray", description: "4oz civilian-grade pepper spray", price: 19.99, stock_quantity: 15, category_id: 8)
pepper_spray.save!

# 4. Create a Revolver product with missing columns (no price and stock_quantity).
begin
  revolver = Product.new(name: "Revolver", description: "6-shot revolver, .38 caliber", category_id: 8)
  revolver.save!
  puts "Created product: #{revolver.name}"
rescue ActiveRecord::RecordInvalid => e
  puts "Error creating Revolver: #{e.message}"
end
