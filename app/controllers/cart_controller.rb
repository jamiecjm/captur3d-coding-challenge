class CartController < ApplicationController

  before_action :authenticate_user!, only: [:checkout, :payment]

  def show
    @line_items = current_line_items.map{|line_item| line_item.attributes.merge(
      {
        cardboard_id: line_item.cardboard.id,
        cardboard_type: line_item.cardboard.cardboard_type,
        cardboard_price: line_item.cardboard.price
      }
    )}

    @cart_metas = current_order_metas

    @item_count = current_order.item_count

  end

  def checkout
    @order = current_order
    @order.attributes = {user_id: current_user.id, order_status: 'Completed'}
    if @order.save
      session[:order_id] = nil
      flash[:success] = 'Order was placed successfully.'
      redirect_to user_order_path(user_id: current_user,id: @order)
    else
      render :show, error: @order.errors.full_messages.join('\n')
    end
  end

  def payment
  end

end
