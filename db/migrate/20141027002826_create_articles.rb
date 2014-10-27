class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.timestamps
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
