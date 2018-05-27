require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do

  before do
    @order = controller.current_order
    @cardboard1 = create(:premium_cardboard)
  end

  describe 'POST #create' do
    it 'creates a line_item object' do
      post :create, params: {line_item: {cardboard_id: @cardboard1.id, quantity: 1}}
      expect(assigns(:line_item).quantity).to eq(1)
    end

    it 'updates a line_item object' do
      line_item = create(:line_item, cardboard: @cardboard1)
      @order.line_items << line_item
      @order.save
      session[:order_id] = @order.id
      post :create, params: {line_item: {cardboard_id: @cardboard1.id, quantity: 1}}
      expect(assigns(:line_item).quantity).not_to eq(1)
    end

    it 'saves a new order and sets order_id in session' do
      post :create, params: {line_item: {cardboard_id: @cardboard1.id, quantity: 1}}
      expect(session[:order_id]).not_to eq(nil)
      expect(controller.current_order.new_record?).to be_falsy
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the line_item' do
      line_item = create(:line_item, cardboard: @cardboard1)
      @order.line_items << line_item
      @order.save
      delete :destroy, params: {id: line_item.id}
      expect(assigns(:line_item).destroyed?).to be_truthy
      expect(response).to redirect_to cart_url
    end
  end

end
