require_relative "ar.rb"

begin
  ActiveRecord::Base.connection
  puts "Database connected successfully!"
rescue ActiveRecord::NoDatabaseError => e
  puts "Database connection error: #{e.message}"
end
