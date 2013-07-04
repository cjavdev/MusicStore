class SwapEmailUsernameUsers < ActiveRecord::Migration
  def up
    add_column :users, :email, :string
    remove_column :users, :username
  end

  def down
    add_column :users, :username, :string
    remove_column :users, :email
  end
end
