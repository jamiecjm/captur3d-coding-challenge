# == Schema Information
#
# Table name: line_items
#
#  id           :bigint(8)        not null, primary key
#  order_id     :integer
#  cardboard_id :integer
#  quantity     :integer          default(0)
#  price        :decimal(10, 2)   default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LineItem < ApplicationRecord

  belongs_to :order
  belongs_to :cardboard

  validates :order_id, uniqueness: { scope: :cardboard_id }

  before_save :calc_price
  after_save :recalculate_order_price
  after_destroy :recalculate_order_price

  def calc_price
    self.price = cardboard.price * quantity
  end

  def recalculate_order_price
    order.calc_all_price
    order.save
  end

end
