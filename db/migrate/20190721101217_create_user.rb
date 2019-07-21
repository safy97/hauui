class CreateUser < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
    	t.string :name
    	t.string :title
    	t.string :confirm_code
    	t.string :password_digest
    	t.boolean :confirmed
    	t.string :reset_token
    	t.string :email
    	t.string :phone
    	t.string :country_code
    	t.float :rate
    	t.decimal :long
    	t.decimal :lat

    	t.timestamps
    end
  end


  def down
  	drop_table :users
  end
end
