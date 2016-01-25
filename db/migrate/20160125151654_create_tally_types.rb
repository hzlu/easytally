class CreateTallyTypes < ActiveRecord::Migration
  def change
    create_table :tally_types do |t|
      t.references :user, index: true
      t.string :type, index: true, unique: true

      t.timestamps null: false
    end
    add_foreign_key :tally_types, :users
  end
end
