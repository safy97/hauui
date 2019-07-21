class CreateHoppy < ActiveRecord::Migration[5.2]
  def up
    create_table :hoppies do |t|
    	t.bigint :hoppy_parent , index: true
    	t.string :name
    end
  end
  def down
  	drop_table :hoppies
  end

end
