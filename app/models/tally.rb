class Tally < ActiveRecord::Base
  belongs_to :user
  belongs_to :tallyable, polymorphic: true
end
