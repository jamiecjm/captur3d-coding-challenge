# == Schema Information
#
# Table name: orders
#
#  id             :bigint(8)        not null, primary key
#  item_count     :integer          default(0), not null
#  item_total     :decimal(10, 2)   default(0.0), not null
#  shipment_total :decimal(10, 2)   default(30.0), not null
#  promo_total    :decimal(10, 2)   default(0.0), not null
#  grand_total    :decimal(10, 2)   default(0.0), not null
#  order_status   :integer          default("In Progress")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
