class RemoveStringColumnFromCat < ActiveRecord::Migration
  def change
    remove_column :cats, :string
  end
end
