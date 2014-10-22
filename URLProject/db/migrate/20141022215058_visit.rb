class Visit < ActiveRecord::Migration
  def up
    remove_column :visits, :short_url
  end
  
  def down
    add_column :visits, :short_url
  end
end
