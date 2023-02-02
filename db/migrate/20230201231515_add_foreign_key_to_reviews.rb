class AddForeignKeyToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :list_id, :bigint, null: false
    add_index :reviews, :list_id, name: "index_reviews_on_list_id"
    add_foreign_key :reviews, :lists
  end
end
