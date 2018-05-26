class CreateOrders < ActiveRecord::Migration[5.1]
  def up
    create_table :orders do |t|
      t.string  :email
      t.integer :item_count, default: 0, null: false
      t.decimal :item_total, precision: 10, scale: 2, default: "0.0", null: false
      t.decimal :shipment_total, precision: 10, scale: 2, default: "0.0", null: false
      t.decimal :promo_total, precision: 10, scale: 2, default: "0.0", null: false
      t.decimal :grand_total, precision: 10, scale: 2, default: "0.0", null: false
      t.integer :order_status
      t.timestamps
    end

    add_index :orders, :email
  end

  def down
    drop_table :orders
  end
end
