class AddIndexToBook < ActiveRecord::Migration[5.1]
  def change
    add_index(:books, :user_id)
    add_index(:books, :created_at)
    add_index(:books, :draft)
  end
end
