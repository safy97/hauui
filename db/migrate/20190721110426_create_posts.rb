class CreatePosts < ActiveRecord::Migration[5.2]
  def up
    create_table :posts do |t|
    	t.references :user , index: true
    	t.references :level ,index: true
    	t.references :hoppy , index: true
    	t.text :content
    	t.timestamps
    end
  end

  def down
  	drop_table :posts
  end
end
