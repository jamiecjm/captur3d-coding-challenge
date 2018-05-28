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
      flash[:error] = @line_item.errors.full_messages.join('\n')
      redirect_back fallback_location: '/'
    end
  end

  def update
    if @line_item.update(line_item_params)
      render json: {line_items: current_line_items, cart_metas: current_order_metas, item_count: current_order.item_count}
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy
    if @line_item.destroyed?
      render json: {line_items: current_line_items, cart_metas: current_order_metas, item_count: current_order.item_count}
    else
      render json: @line_item.errors, status: :unprocessable_entity
    end
    # respond_to do |format|
    #   format.html { redirect_to cart_url, notice: 'Item was successfully removed.' }
    #   format.json { head :no_content }
    # end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:quantity, :cardboard_id)
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end
end
