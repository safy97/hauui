class CreateDevice < ActiveRecord::Migration[5.2]
  def up
    create_table :devices do |t|
    	t.references :user , index:true
    	t.string :uuid
    	t.boolean :logged_in

    	t.timestamps

    end
  end

  def down
  	drop_table :devices
  end

end
