# == Schema Information
#
# Table name: line_items
#
#  id           :bigint(8)        not null, primary key
#  order_id     :integer
#  cardboard_id :integer
#  quantity     :integer          default(0)
#  price        :decimal(10, 2)   default(0.0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
