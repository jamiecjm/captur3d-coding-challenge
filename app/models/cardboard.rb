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

class Cardboard < ApplicationRecord

  has_many :line_items
  has_many :orders, through: :line_items

  validates :cardboard_type, uniqueness: true

end
