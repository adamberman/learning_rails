class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      
      t.timestamps
      
      
    end
  end
  
end

class AddIndexes < ActiveRecord::Migration
  def change
    add_index(:users, :email, unique: true)
  end
end
