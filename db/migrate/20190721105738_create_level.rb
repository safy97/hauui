class CreateLevel < ActiveRecord::Migration[5.2]
  def up
    create_table :levels do |t|
    	t.string :name
    end
  end
  
  def down
  	drop_table :levels
  end

end
