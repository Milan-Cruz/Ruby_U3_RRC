require_relative "ar.rb"

# Find all products with a stock quantity greater than 40.
products_with_high_stock = Product.where("stock_quantity > 40")

# Add 1 to the stock quantity of each product and save the changes.
products_with_high_stock.each do |product|
  product.stock_quantity += 1
  product.save
  puts "Updated product: #{product.name}, new stock quantity: #{product.stock_quantity}"
end
