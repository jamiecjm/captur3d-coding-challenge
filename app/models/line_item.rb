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

  def calc_price
    self.price = cardboard.price * quantity
  end

end
