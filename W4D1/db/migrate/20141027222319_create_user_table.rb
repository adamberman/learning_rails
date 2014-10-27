class CreateUserTable < ActiveRecord::Migration
  def change
    create_table "users", force: true do |t|
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "username", null: false
    end

    add_index "users", ["username"], name: "index_users_on_username", unique: true
  end
end
