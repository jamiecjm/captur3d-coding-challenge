# == Schema Information
#
# Table name: cardboards
#
#  id             :bigint(8)        not null, primary key
#  cardboard_type :string
#  price          :decimal(10, 2)   default(0.0), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Cardboard, type: :model do

  before do
    @cardboard1 = create(:premium_cardboard)
  end

  it 'is valid with valid attributes' do
    expect(@cardboard1).to be_valid
  end

  it 'has a unique cardboard type' do
    cardboard2 = build(:premium_cardboard, price: 100)
    expect(cardboard2).to_not be_valid
  end

end
