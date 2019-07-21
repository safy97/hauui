class AddIndexToUsers < ActiveRecord::Migration[5.2]
  def up
  	add_index :users , [:country_code, :phone] , unique: true
  	add_index :users , :email , unique: true
  end
end
