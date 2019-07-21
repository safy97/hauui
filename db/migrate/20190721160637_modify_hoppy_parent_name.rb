class ModifyHoppyParentName < ActiveRecord::Migration[5.2]
  def up
  	rename_column :hoppies, :hoppy_parent , :hoppy_parent_id
  end

  def down
  	rename_column :hoppies, :hoppy_parent_id , :hoppy_parent
  end
end
