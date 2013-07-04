class AddActiveFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_active, :boolean, :default => 0
  end
end
