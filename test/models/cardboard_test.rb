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

require 'test_helper'

class CardboardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
