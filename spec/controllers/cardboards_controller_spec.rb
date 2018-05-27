require 'rails_helper'

RSpec.describe CardboardsController, type: :controller do

  before do
    @cardboard1 = create(:premium_cardboard)
    @cardboard2 = create(:hq_cardboard)
  end

  describe 'GET index' do
    it 'assigns @cardboards' do
      get :index
      @cardboards = Cardboard.all.map{|cardboard| cardboard.attributes.merge(url: cardboard_path(cardboard.id))}
      expect(assigns(:cardboards)).to eq(@cardboards)
    end
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it 'assigns @cardboard' do
      get :show, params: {id: @cardboard1.id}
      expect(assigns(:cardboard)).to eq(@cardboard1)
    end
    it 'renders the #show template' do
      get :show, params: {id: @cardboard1.id}
      expect(response).to render_template :show
    end
  end
end
