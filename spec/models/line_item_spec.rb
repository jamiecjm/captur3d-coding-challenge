# == Schema Information
#
# Table name: line_items
#
#  id           :bigint(8)        not null, primary key
#  price        :decimal(10, 2)   default(0.0), not null
#  quantity     :integer          default(0)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  cardboard_id :integer
#  order_id     :integer
#
# Indexes
#
#  index_line_items_on_cardboard_id               (cardboard_id)
#  index_line_items_on_order_id                   (order_id)
#  index_line_items_on_order_id_and_cardboard_id  (order_id,cardboard_id)
#

require 'rails_helper'

RSpec.describe LineItem, type: :model do

  before do
    @line_item = create(:line_item)
    @order = @line_item.order
    @cardboard = @line_item.cardboard
  end

  it 'is valid with valid attributes' do
    expect(@line_item).to be_valid
  end

  it 'has a unique order_id and cardboard_id pair' do
    line_item2 = @line_item.dup
    line_item2.attributes= {quantity: 2}
    expect(line_item2).to_not be_valid
  end

  context 'price' do
    it 'is calculated before save' do
      expect(@line_item.price).to_not eq(0)
    end

    it 'equals to cardboard price times quantity' do
      price = @cardboard.price * @line_item.quantity
      expect(@line_item.price).to eq(price)
    end
  end

  context 'triggers order price calculation when' do
    it 'line_item is saved' do
      expect(@order.grand_total).to_not eq(0)
    end

    it 'line_item is destroyed' do
      original_total = @order.grand_total
      @line_item.destroy
      new_total = @order.grand_total
      expect(new_total).to_not eq(original_total)
    end
  end

end
