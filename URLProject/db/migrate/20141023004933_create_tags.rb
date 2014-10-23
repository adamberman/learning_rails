class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :url_id
      t.string :tag
    end 
    add_index(:tags, :url_id)  
    add_index(:tags, :tag)  
  end
end
