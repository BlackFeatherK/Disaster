class AddColumnCategoryIdToTopic < ActiveRecord::Migration[5.0]
  add_column :topics , :category_id , :integer
  add_index :topics , :category_id
end
