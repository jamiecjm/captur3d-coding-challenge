# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Sample cardboards data
Cardboard.create!(cardboard_type: 'Premium', price: 30)
Cardboard.create!(cardboard_type: 'High Quality', price: 20)

# Sample promotions data
Promotion.create!(promotion_type: 0, requirement_field: 'item_count', requirement_operator: 'mteq', requirement_amount: 10, description: 'Free shipping on orders over or equal to 10 items')
Promotion.create!(promotion_type: 1, discount_amount: 10, requirement_field: 'item_count', requirement_operator: 'mt', requirement_amount: 20, description: '10% discount on orders over 20 items')


Customer.create!(email: 'customer@example.com', password: 'password', password_confirmation: 'password')
