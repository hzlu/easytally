class CreateTallies < ActiveRecord::Migration
  def change
    create_table :tallies do |t|
      t.references :user, index: true
      t.string :remark
      t.decimal :amount, precision: 9, scale: 2

      t.timestamps null: false
    end
    add_foreign_key :tallies, :users
  end
end
