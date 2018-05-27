class ChangeOrderEmailToUserId < ActiveRecord::Migration[5.1]
  def up
    remove_column :orders, :email
    add_column :orders, :user_id, :integer
    add_index :orders, :user_id
  end

  def down
    remove_column :orders, :user_id
    add_column :orders, :email, :string
    add_index :orders, :email
  end
end
