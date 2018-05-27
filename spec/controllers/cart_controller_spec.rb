require 'rails_helper'

RSpec.describe CartController, type: :controller do
  before do
    @order = controller.current_order
    @line_item = build(:line_item, order: nil)
    @order.line_items << @line_item
    @order.save
    session[:order_id] = @order.id
  end


  describe 'GET #show' do

    it 'assigns @line_items' do
      get :show
      @line_items = [@line_item].map{|line_item| line_item.attributes.merge(
        {
          cardboard_type: line_item.cardboard.cardboard_type,
          cardboard_price: line_item.cardboard.price
        }
      )}
      expect(assigns(:line_items)).to eq(@line_items)
    end

    it 'renders the #show template' do
      get :show
      expect(response).to render_template :show
    end
  end

  describe 'POST #checkout' do
    context 'when no user has signed in' do
      it 'redirects the user to sign in page' do
        post :checkout
        expect(response).to redirect_to '/users/sign_in'
        expect(flash[:alert]).to match(/^You need to sign in or sign up before continuing./)
      end
    end

    context 'when a user has signed in' do
      it 'updates the current order with new user_id and order_status' do
        user = create(:user)
        sign_in user
        post :checkout
        expect(assigns(:order).user_id).to eq(controller.current_user.id)
        expect(assigns(:order).order_status).to eq('Completed')
        expect(response).to redirect_to controller.user_order_path(user_id: controller.current_user,id: assigns(:order))
        # expect(flash[:success]).to match(/^Order was successfully placed/)
      end
    end
  end

end
