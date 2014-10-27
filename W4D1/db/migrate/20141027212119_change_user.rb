class ChangeUser < ActiveRecord::Migration
  def change
    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :username, :string, null: false, :default => "unknown"
    add_index :users, :username, unique: true 
  end
end
