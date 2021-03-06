class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false, unique: true
      t.text :description
      t.integer :moderator_id
      
      t.timestamps
    end
    
    add_index :subs, :moderator_id
  end
end
