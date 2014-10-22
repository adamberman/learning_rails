class Visit1 < ActiveRecord::Migration
  def change
    add_column :visits, :shortened_url, :integer
  end
end
