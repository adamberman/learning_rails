class Visit4 < ActiveRecord::Migration
  def change
     add_column :visits, :user, :integer
  end
end
