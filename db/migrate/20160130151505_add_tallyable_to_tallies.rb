class AddTallyableToTallies < ActiveRecord::Migration
  def up
    change_table :tallies do |t|
      t.references :tallyable, polymorphic: true
    end
  end

  def down
    change_table :tallies do |t|
      t.remove_references :tallyable, polymorphic: true
    end
  end
end
