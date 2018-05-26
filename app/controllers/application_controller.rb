class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  helper_method :current_order

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

end
