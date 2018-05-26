class LineItem < ApplicationRecord

  belongs_to :order
  belongs_to :cardboard

  validates :order_id, uniqueness: { scope: :cardboard_id }

  before_save :calc_price

  private

  def calc_price
    self.price = cardboard.price * quantity
  end

end
