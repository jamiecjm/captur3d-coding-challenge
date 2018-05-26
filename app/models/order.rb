class Order < ApplicationRecord

  belongs_to :user, primary_key: :email, foreign_key: :email, optional: true
  has_many :line_items
  has_many :cardboards, through: :line_items

  enum order_status: ['In Progress': 0, 'Completed': 1]
end
