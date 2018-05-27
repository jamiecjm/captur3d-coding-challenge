class LineItemsController < ApplicationController

  before_action :set_line_item, only: [:update, :destroy]

  def create
    @order = current_order
    @line_item = @order.line_items.find_or_initialize_by(cardboard_id: line_item_params[:cardboard_id])
    @line_item.quantity += line_item_params[:quantity].to_i
    if @line_item.save
      session[:order_id] = @order.id
      redirect_back fallback_location: '/', notice: 'Item was successfully added to cart.'
    else
      redirect_back fallback_location: '/', error: @line_item.errors.full_messages.join('\n')
    end
  end

  def update
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to cart_url, notice: 'Item was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :cardboard_id)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
