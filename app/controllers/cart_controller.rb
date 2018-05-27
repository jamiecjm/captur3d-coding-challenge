class CartController < ApplicationController

  before_action :authenticate_user!, only: [:checkout, :payment]

  def show
    @line_items = current_order.line_items.map{|line_item| line_item.attributes.merge(
      {
        cardboard_type: line_item.cardboard.cardboard_type,
        cardboard_price: line_item.cardboard.price
      }
    )}
  end

  def checkout
    @order = current_order
    @order.user_id = current_user.id
    if @order.save
      session[:order_id] = nil
      redirect_to user_order_path(user_id: current_user,id: @order), success: 'Order was successfully placed'  
    else
      redirect_back fallback_location: checkout_path, error: error_message
    end
  end

  def payment
  end

end
