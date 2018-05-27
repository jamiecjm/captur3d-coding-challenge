# == Schema Information
#
# Table name: promotions
#
#  id                   :bigint(8)        not null, primary key
#  description          :text
#  discount_amount      :decimal(10, 2)   default(0.0), not null
#  promotion_type       :integer          not null
#  requirement_amount   :integer          default(0), not null
#  requirement_field    :integer          default("id"), not null
#  requirement_operator :integer          default("mt"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe Promotion, type: :model do
  before do
    @promotion = create(:free_shipping_promotion)
  end

  it 'is valid with valid attributes' do
    expect(@promotion).to be_valid
  end

  it 'has a discount_amount' do
    promotion = build(:free_shipping_promotion, discount_amount: nil)
    expect(promotion).to_not be_valid
  end

  it 'has a promotion_type' do
    promotion = build(:free_shipping_promotion, promotion_type: nil)
    expect(promotion).to_not be_valid
  end

  it 'has a requirement_amount' do
    promotion = build(:free_shipping_promotion, requirement_amount: nil)
    expect(promotion).to_not be_valid
  end

  it 'has a requirement_field' do
    promotion = build(:free_shipping_promotion, requirement_field: nil)
    expect(promotion).to_not be_valid
  end

  it 'has a requirement_operator' do
    promotion = build(:free_shipping_promotion, requirement_operator: nil)
    expect(promotion).to_not be_valid
  end
end
