class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |my_sexy_table|
      my_sexy_table.string :title
      my_sexy_table.integer :author_id
      
      my_sexy_table.timestamps
    end
    
    add_index :polls, :author_id
  end
end
