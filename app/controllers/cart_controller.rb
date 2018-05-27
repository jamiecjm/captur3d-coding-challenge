class CartController < ApplicationController

  before_action :authenticate_user!, only: [:checkout, :payment]

  def show
    @line_items = current_order.line_items.map{|line_item| line_item.attributes.merge(
      {
        cardboard_type: line_item.cardboard.cardboard_type,
        cardboard_price: line_item.cardboard.price
      }
    )}

    @cart_metas = [
      {title: 'Subtotal', value: current_order.item_total},
      {title: 'Discount', value: current_order.promo_total},
      {title: 'Shipping Fee', value: current_order.shipment_total},
      {title: 'Total', value: current_order.grand_total}
    ]

  end

  def checkout
    @order = current_order
    @order.attributes = {user_id: current_user.id, order_status: 'Completed'}
    if @order.save
      session[:order_id] = nil
      redirect_to user_order_path(user_id: current_user,id: @order), success: 'Order was successfully placed'
    else
      render :show, error: @order.errors.full_messages.join('\n')
    end
  end

  def payment
  end

end
