require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  before do
    @user = create(:user)
    @order1 = create(:order, order_status: 'In Progress', user: @user)
    @order2 = create(:order, order_status: 'Completed', user: @user)
    sign_in @user
    @user2 = create(:user, email: 'admin@example.com')
  end

  describe 'GET index' do
    context 'visited by orders\' user' do
      it 'assigns @orders to current_user\'s completed orders' do
        get :index, params: {user_id: @user.id}
        expect(assigns(:orders)).to eq([@order2])
      end
      it 'renders the index template' do
        get :index, params: {user_id: @user.id}
        expect(response).to render_template('index')
      end
    end

    context 'visited by other user' do
      it 'it redirects_back or to homepage' do
        sign_out @user
        sign_in @user2
        get :index, params: {user_id: @user.id}
        expect(response).to redirect_to '/'
      end
    end
  end

  describe 'GET #show' do
    context 'visited by orders\' user' do
      it 'assigns @order' do
        get :show, params: {id: @order2.id, user_id: @user.id}
        expect(assigns(:order)).to eq(@order2)
      end

      it 'assigns @order to  nil if order is still in progress' do
        get :show, params: {id: @order1.id, user_id: @user.id}
        expect(assigns(:order)).to eq(nil)
        expect(response).to redirect_to '/'
      end

      it 'assigns @line_items' do
        get :show, params: {id: @order2.id, user_id: @user.id}
        expect(assigns(:line_items)).to eq(@order2.line_items)
      end

      it 'renders the #show template' do
        get :show, params: {id: @order2.id, user_id: @user.id}
        expect(response).to render_template :show
      end
    end

    context 'visited by other user' do
      it 'it redirects_back or to homepage' do
        sign_out @user
        sign_in @user2
        get :show, params: {id: @order2.id, user_id: @user.id}
        expect(response).to redirect_to '/'
      end
    end
  end
end
