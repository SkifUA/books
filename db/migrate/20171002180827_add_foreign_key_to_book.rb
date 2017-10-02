class AddForeignKeyToBook < ActiveRecord::Migration[5.1]
  def up
    add_foreign_key :books, :users, name: "books_on_user_id"
  end

  def down
    remove_foreign_key :books, name: "books_on_user_id"
  end
end
