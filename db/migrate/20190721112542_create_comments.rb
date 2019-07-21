class CreateComments < ActiveRecord::Migration[5.2]
  def up
    create_table :comments do |t|
    	t.references :user , index: true
    	t.references :post , index: true
    	t.text :content

    	t.timestamps
    end
  end

  def down
  	drop_table :comments
  end
end
