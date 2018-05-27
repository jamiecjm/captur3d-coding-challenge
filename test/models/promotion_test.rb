# == Schema Information
#
# Table name: promotions
#
#  id                   :bigint(8)        not null, primary key
#  promotion_type       :integer          not null
#  discount_amount      :decimal(10, 2)   default(0.0), not null
#  requirement_field    :integer          default("id"), not null
#  requirement_operator :integer          default("mt"), not null
#  requirement_amount   :integer          default(0), not null
#  description          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class PromotionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
