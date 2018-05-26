class CartController < ApplicationController
  def show
    @line_items = current_order.line_items.map{|line_item| line_item.attributes.merge(
      {
        cardboard_type: line_item.cardboard.cardboard_type,
        cardboard_price: line_item.cardboard.price
      }
    )}
  end
end
