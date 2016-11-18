class CreateCategoryTopicships < ActiveRecord::Migration[5.0]
  def change
    create_table :category_topicships do |t|
    	t.integer :topic_id
    	t.integer :category_id
      t.timestamps
    end
    add_index :category_topicships , :topic_id
    add_index :category_topicships , :category_id
  end
end
