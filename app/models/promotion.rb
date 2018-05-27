class Promotion < ApplicationRecord

  has_and_belongs_to_many :orders

  enum promotion_type: {free_shipping: 0, fixed_discount_rate: 1, fixed_discount_amount: 2}

end
