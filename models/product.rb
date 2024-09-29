# class Product < ActiveRecord::Base
# This AR object is linked with the products table.

# A product has a many to one relationship with a category.
# The products table has a category_id foreign key.
# In other words, a product belongs to a category.
#   belongs_to :category
# end

class Product < ActiveRecord::Base
  # Product model linked with products table
  belongs_to :category

  # Validations to ensure all required fields are present
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, :price, :stock_quantity, presence: true
end
