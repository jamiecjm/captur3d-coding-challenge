# == Schema Information
#
# Table name: promotions
#
#  id                   :bigint(8)        not null, primary key
#  promotion_type       :integer          not null
#  discount_amount      :decimal(10, 2)   default(0.0), not null
#  requirement_field    :integer          default("id"), not null
#  requirement_operator :integer          default("mt"), not null
#  requirement_amount   :integer          default(0), not null
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Promotion < ApplicationRecord

  has_and_belongs_to_many :orders

  enum promotion_type: ['Free Shipping', 'Fixed Discount Rate', 'Fixed Discount Amount']
  enum requirement_field: Order.attribute_names

  # eq = equal
  # mt = more than, mteq = more than or equal to
  # lt = less than, lteq = less than or equal to
  enum requirement_operator: ['mt', 'mteq', 'eq', 'lt', 'lteq']

  def operator_to_symbol
    case requirement_operator
      when 'mt'
        '>'
      when 'mteq'
        '>='
      when 'eq'
        '='
      when 'lt'
        '<'
      when 'lteq'
        '<='
    end
  end

end
