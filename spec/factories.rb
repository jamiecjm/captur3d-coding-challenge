FactoryBot.define do
  factory :user do
    email 'customer@example.com'
    password 'customer123'
    password_confirmation 'customer'
  end

  factory :free_shipping_promotion, class: 'Promotion' do
    promotion_type 0
    requirement_field 'item_count'
    requirement_operator 'mteq'
    requirement_amount 10
    description 'Free shipping if order more than or equal to 10 items'
  end

  factory :discount_promotion, class: 'Promotion' do
    promotion_type 1
    discount_amount 10
    requirement_field 'item_count'
    requirement_operator 'mt'
    requirement_amount 20
    description '10% discount if order more than 20 items'
  end

  factory :order do

  end

  factory :line_item do
    quantity 1
    association :cardboard, factory: :premium_cardboard
    association :order, factory: :order
  end

  factory :premium_cardboard, class: 'Cardboard' do
    cardboard_type 'Premium'
    price 30
  end

  factory :hq_cardboard, class: 'Cardboard' do
    cardboard_type 'High Quality'
    price 20
  end

end
