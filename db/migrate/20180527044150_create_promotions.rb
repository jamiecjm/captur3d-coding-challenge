class CreatePromotions < ActiveRecord::Migration[5.1]
  def up
    create_table :promotions do |t|
      t.integer :promotion_type, null: false
      t.decimal :discount_amount, precision: 10, scale: 2, default: "0.0", null: false
      t.integer :requirement_field, default: 'item_count', null: false
      t.integer :requirement_operator, default: '>', null: false
      t.integer :requirement_amount, default: 0, null: false
      t.text :description
      t.timestamps
    end
  end

  def down
    drop_table :promotions
  end
end
