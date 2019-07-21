class CreateReplies < ActiveRecord::Migration[5.2]
  def up
    create_table :replies do |t|
    	t.references :user , index: true
    	t.references :comment, index: true
    	t.text :content

    	t.timestamps
    end
  end

  def down
  	drop_table :replies
  end
end
