require_relative "ar.rb"

# 1. Find any product from the database and inspect it.
product = Product.first
puts "First Product: #{product.inspect}"

# 2. Total number of products.
total_products = Product.count
puts "Total number of products: #{total_products}"

# 3. Find the names of all products above $10 with names that begin with 'C'.
products_above_10_with_c = Product.where("price > 10 AND name LIKE 'C%'").pluck(:name)
puts "Products above $10 starting with 'C': #{products_above_10_with_c.join(", ")}"

# 4. Total number of products with a low stock quantity (less than 5).
low_stock_products_count = Product.where("stock_quantity < 5").count
puts "Total products with low stock (less than 5): #{low_stock_products_count}"

# 5. Find the name of the category associated with the first product.
category_of_product = product.category
puts "The category associated with #{product.name} is #{category_of_product.name}"

# 6. Find a specific category and use it to build and persist a new product.
category = Category.find_by(name: "Beverages") # Example category name
if category
  existing_product = category.products.find_by(name: "Jack Daniels No.07")

  if existing_product
    puts "Product 'Jack Daniels No.07' already exists under category: #{category.name}"
  else
    new_product = category.products.build(name: "Jack Daniels No.07", description: "An excellent Tennessee Whiskey", price: 39.99, stock_quantity: 7)
    new_product.save
    puts "Created new product: #{new_product.name} under category: #{category.name}"
  end
else
  puts "Category 'Beverages' not found."
end

# 7. Find a specific category and locate all its associated products over a certain price.
high_price_products = category.products.where("price > 15")
puts "Products under #{category.name} over $15: #{high_price_products.pluck(:name).join(", ")}"

# Force a WAL checkpoint to flush the WAL file to the main database
ActiveRecord::Base.connection.execute("PRAGMA wal_checkpoint(TRUNCATE)")

# Close the connection to the database
ActiveRecord::Base.connection.close
