class CreatePostLinks < ActiveRecord::Migration[5.2]
  def up
    create_table :post_links do |t|
    	t.string :link
    	t.references :post , index: true
    end
  end

  def down
  	drop_table :post_links
  end
end
