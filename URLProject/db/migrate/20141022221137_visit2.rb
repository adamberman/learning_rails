class Visit2 < ActiveRecord::Migration
  def up
    remove_column :visits, :user_id
  end
  
  def down
    add_column :visits, :user_id
  end
end
