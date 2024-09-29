require_relative "ar.rb"

# Temporarily switch SQLite to DELETE mode to clean up WAL/SHM files
ActiveRecord::Base.connection.execute("PRAGMA journal_mode = DELETE")

# Find the "Car Rear View Mirror" product.
car_mirror = Product.find_by(name: "Car Rear View Mirror")

# Delete the product from the database if it exists.
if car_mirror
  car_mirror.destroy
  puts "Deleted product: #{car_mirror.name}"
else
  puts "Product not found."
end
