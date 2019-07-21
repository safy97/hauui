class AddBirthdateToUser < ActiveRecord::Migration[5.2]
  def up
  	add_column "users" , "birthdate" , :string 
  end

  def down
  	remove_column "users" , "birthdate"
  end
end
