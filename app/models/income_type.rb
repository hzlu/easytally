class IncomeType < ActiveRecord::Base
  belongs_to :user
  has_many :income_tallies, :as => :tallyable, :class_name => 'Tally'
end
