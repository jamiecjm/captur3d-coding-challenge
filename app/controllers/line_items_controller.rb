class LineItemsController < ApplicationController

  before_action :set_line_item, only: [:update, :destroy]

  def create
    @order = current_order
    @line_item = @order.line_items.find_or_initialize_by(cardboard_id: line_item_params[:cardboard_id])
    @line_item.quantity += line_item_params[:quantity].to_i
    if @line_item.save
      @order.save
      session[:order_id] = @order.id
    else

    end
  end

  def update
  end

  def destroy
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :cardboard_id)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
