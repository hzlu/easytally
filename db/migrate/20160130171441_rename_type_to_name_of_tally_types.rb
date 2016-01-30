class RenameTypeToNameOfTallyTypes < ActiveRecord::Migration
  def up
    rename_column :tally_types, :type, :name
  end

  def down
    rename_column :tally_types, :name, :type
  end
end
