class CreateOrdersPromotions < ActiveRecord::Migration[5.1]
  def up
    create_join_table :orders, :promotions do |t|
      t.index :order_id
      t.index :promotion_id
      t.index [:order_id, :promotion_id], unique: true
    end
  end

  def down
    drop_join_table :orders, :promotions
  end
end
