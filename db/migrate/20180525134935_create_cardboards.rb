class CreateCardboards < ActiveRecord::Migration[5.1]
  def change
    create_table :cardboards do |t|
      t.string :cardboard_type
      t.decimal :price, precision: 10, scale: 2, default: "0.0", null: false

      t.timestamps
    end
  end
end
