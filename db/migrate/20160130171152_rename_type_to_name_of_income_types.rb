class RenameTypeToNameOfIncomeTypes < ActiveRecord::Migration
  def up
    rename_column :income_types, :type, :name
  end

  def down
    rename_column :income_types, :name, :type
  end
end
