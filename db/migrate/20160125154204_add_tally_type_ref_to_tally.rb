class AddTallyTypeRefToTally < ActiveRecord::Migration
  def change
    add_reference :tallies, :tally_type, index: true
    add_foreign_key :tallies, :tally_types
  end
end
