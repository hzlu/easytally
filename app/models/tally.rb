class Tally < ActiveRecord::Base
  belongs_to :user
  belongs_to :tallyable, polymorphic: true

  scope :income, -> { where('amount >= 0') }
  scope :expend, -> { where('amount < 0') }
end
