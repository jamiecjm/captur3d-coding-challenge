class Order < ApplicationRecord

  belongs_to :user, optional: true
  has_many :line_items, dependent: :destroy
  has_many :cardboards, through: :line_items

  enum order_status: {'In Progress': 0, 'Completed': 1}

  before_save :price_calculation

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

  def price_calculation
    calc_item_count
    calc_item_total
    calc_shipment_total
    calc_promo_total
    calc_grand_total
  end

end
