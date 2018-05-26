class CreateCardboards < ActiveRecord::Migration[5.1]
  def up
    create_table :cardboards do |t|
      t.string :cardboard_type
      t.decimal :price, precision: 10, scale: 2, default: "0.0", null: false

      t.timestamps
    end
  end

  def down
    drop_tab;e :cardboards
  end
end
