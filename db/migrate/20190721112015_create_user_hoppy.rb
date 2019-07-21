class CreateUserHoppy < ActiveRecord::Migration[5.2]
  def up
    create_table :user_hoppies do |t|
    	t.references :user , index: true
    	t.references :hoppy , index: true
    	t.references :level , index: true

    end
  end

  def down
  	drop_table :user_hoppies
  end
end
