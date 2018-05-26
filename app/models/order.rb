class Order < ApplicationRecord

  belongs_to :user, primary_key: :email, foreign_key: :email, optional: true
  
end
