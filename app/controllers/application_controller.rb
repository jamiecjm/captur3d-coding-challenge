class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_order, :current_order_metas, :current_line_items

  def current_order
    if !session[:order_id].nil?
      begin
        Order.find(session[:order_id])
      rescue ActiveRecord::RecordNotFound
        Order.new
      end
    else
      Order.new
    end
  end

  def current_order_metas
    [
      {title: 'Subtotal', value: current_order.item_total},
      {title: 'Discount', value: current_order.promo_total},
      {title: 'Shipping Fee', value: current_order.shipment_total},
      {title: 'Total', value: current_order.grand_total}
    ]
  end

  def current_line_items
    current_order.line_items.order(:id)
  end

end
