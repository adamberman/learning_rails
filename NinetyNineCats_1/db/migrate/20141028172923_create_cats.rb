class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.date :birth_date
      t.string :color
      t.string :name
      t.string :string
      t.string :sex
      t.text :description

      t.timestamps
    end
  end
end
