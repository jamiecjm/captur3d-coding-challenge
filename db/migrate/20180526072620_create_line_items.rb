class CreateLineItems < ActiveRecord::Migration[5.1]
  def up
    create_table :line_items do |t|
      t.integer :order_id
      t.integer :cardboard_id
      t.integer :quantity, default: 0
      t.decimal :price, precision: 10, scale: 2, default: "0.0", null: false
      t.timestamps
    end

    add_index :line_items, :order_id
    add_index :line_items, :cardboard_id
    add_index :line_items, [:order_id, :cardboard_id]
  end

  def down
    drop_table :line_items
  end
end
