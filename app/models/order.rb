# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  item_count     :integer          default(0), not null
#  item_total     :decimal(10, 2)   default(0.0), not null
#  shipment_total :decimal(10, 2)   default(30.0), not null
#  promo_total    :decimal(10, 2)   default(0.0), not null
#  grand_total    :decimal(10, 2)   default(0.0), not null
#  order_status   :integer          default("In Progress")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Order < ApplicationRecord

  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy
  has_many :cardboards, through: :line_items
  has_and_belongs_to_many :promotions

  enum order_status: {'In Progress': 0, 'Completed': 1}

  def calc_item_count
    self.item_count = line_items.sum(:quantity)
  end

  def calc_item_total
    self.item_total = line_items.sum(:price)
  end

  def calc_shipment_total
  end

  def calc_promo_total
  end

  def calc_grand_total
    self.grand_total = item_total + shipment_total + promo_total
  end

  def calc_all_price
    calc_item_count
    calc_item_total
    calc_shipment_total
    calc_promo_total
    calc_grand_total
  end

end
