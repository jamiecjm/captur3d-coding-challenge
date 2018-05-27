# == Schema Information
#
# Table name: promotions
#
#  id                   :bigint(8)        not null, primary key
#  promotion_type       :integer          not null
#  discount_amount      :decimal(10, 2)   default(0.0), not null
#  requirement_field    :string
#  requirement_operator :string           default("mt")
#  requirement_amount   :integer          default(0), not null
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Promotion < ApplicationRecord

  has_and_belongs_to_many :orders

  enum promotion_type: {free_shipping: 0, fixed_discount_rate: 1, fixed_discount_amount: 2}

end
