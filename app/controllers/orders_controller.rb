class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  before_action :authenticate_user!
  before_action :current_user_only

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.where(order_status: 1)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    if @order
      @line_items = @order.line_items
    else
      redirect_back fallback_location: '/', notice: 'Order was not found'
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by(id: params[:id], order_status: 'Completed')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end

    def current_user_only
      if params[:user_id].to_i != current_user.id
        redirect_back fallback_location: '/', notice: 'You are not allowed to perform this action.'
      end
    end
end
