class ChangeBooleanCols < ActiveRecord::Migration[5.2]
def up
  change_column :users, :confirmed, :boolean, default: false
  change_column :devices, :logged_in, :boolean, default: true
  
end

def down
  change_column :users, :confirmed, :boolean, default: nil
  change_column :devices, :logged_in, :boolean, default: nil
  
end
end
