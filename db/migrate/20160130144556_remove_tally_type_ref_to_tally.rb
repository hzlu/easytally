class RemoveTallyTypeRefToTally < ActiveRecord::Migration
  def up
    remove_foreign_key :tallies, :tally_types
    remove_index :tallies, :tally_type_id
    remove_column :tallies, :tally_type_id
  end

  def down
    add_column :tallies, :tally_type_id, :integer
    add_index :tallies, :tally_type_id
    add_foreign_key :tallies, :tally_types
  end
end
