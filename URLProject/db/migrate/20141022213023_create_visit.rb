class CreateVisit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :short_url
      
      t.timestamp
    end
    
    add_index(:visits, :short_url)
    add_index(:visits, :user_id)
  end
end
