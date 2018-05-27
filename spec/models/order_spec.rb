# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  grand_total    :decimal(10, 2)   default(0.0), not null
#  item_count     :integer          default(0), not null
#  item_total     :decimal(10, 2)   default(0.0), not null
#  order_status   :integer          default("In Progress")
#  promo_total    :decimal(10, 2)   default(0.0), not null
#  shipment_total :decimal(10, 2)   default(30.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @line_item = create(:line_item)
    @order = @line_item.order
    @cardboard2 = create(:hq_cardboard)
    @line_item2 = @line_item.dup
    @line_item2.attributes = {cardboard: @cardboard2, order: @order}
    @line_item2.save
    @free_shipping_promotion = create(:free_shipping_promotion)
    @discount_promotion = create(:discount_promotion)
  end

  it 'is valid with valid attributes' do
    expect(@order).to be_valid
  end

  it 'has a default \'In Progress\' status' do
    expect(@order.order_status).to eq('In Progress')
  end

  describe 'calc_item_total' do
    it 'update its item_total to the sum of line items price' do
      @order.item_total = 0
      total_price = @order.line_items.sum(:price)
      @order.calc_item_total
      expect(@order.item_total).to eq(total_price)
    end
  end

  describe 'calc_item_count' do
    it 'update its item_count to the sum of line items quantity' do
      @order.item_count = 0
      total_item = @order.line_items.sum(:quantity)
      @order.calc_item_count
      expect(@order.item_count).to eq(total_item)
    end
  end

  describe 'calc_shipment_total' do

    it 'should return 30 for shipment_total if no free shipping promotions applicable' do
      expect(@order.shipment_total).to eq(30)
    end

    it 'should return 0 for shipment_total if free shipping promotions applicable' do
      @line_item.update(quantity: 10)
      @order.shipment_total = 30
      @order.calc_shipment_total
      expect(@order.shipment_total).to eq(0)
    end

  end

  describe 'calc_promo_total' do

    it 'should return 0 for promo_total if no discount promotions applicable' do
      expect(@order.promo_total).to eq(0)
    end

    it 'should return discount(rate)*item_total if discount(fixed_rate) promotions applicable' do
      @line_item.update(quantity: 20)
      rate = @discount_promotion.discount_amount/100
      discount = @order.item_total * rate
      @order.promo_total = 0
      @order.calc_promo_total
      expect(@order.promo_total).to eq(-discount)
    end

    it 'should return discount_amount if discount(fixed_amount) promotions applicable' do
      @line_item.update(quantity: 20)
      @discount_promotion.update(promotion_type: 'Fixed Discount Amount')
      discount = @discount_promotion.discount_amount
      @order.promo_total = 0
      @order.calc_promo_total
      expect(@order.promo_total).to eq(-discount)
    end

  end

  describe 'promotion_applicable?' do
    context 'check an order eligibility for certain promotion,' do

      it 'return true if eligible' do
        @line_item.update(quantity: 10)
        expect(@order.promotion_applicable?(@free_shipping_promotion)).to be_truthy
      end

      it 'return false if not eligible' do
        expect(@order.promotion_applicable?(@free_shipping_promotion)).to be_falsy
      end

    end
  end

end
