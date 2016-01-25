class AddUsernameAndGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :gender, :boolean, :default => true
  end
end
