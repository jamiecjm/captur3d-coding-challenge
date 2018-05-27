# == Schema Information
#
# Table name: line_items
#
#  id           :bigint(8)        not null, primary key
#  price        :decimal(10, 2)   default(0.0), not null
#  quantity     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cardboard_id :integer
#  order_id     :integer
#
# Indexes
#
#  index_line_items_on_cardboard_id               (cardboard_id)
#  index_line_items_on_order_id                   (order_id)
#  index_line_items_on_order_id_and_cardboard_id  (order_id,cardboard_id)
#

class LineItem < ApplicationRecord

  belongs_to :order
  belongs_to :cardboard

  validates :order_id, uniqueness: { scope: :cardboard_id }

  before_save :calc_price
  after_save :calculate_order_price
  after_destroy :calculate_order_price

  def calc_price
    self.price = cardboard.price * quantity
  end

  def calculate_order_price
    order.calc_all_price
    order.save
  end

end
