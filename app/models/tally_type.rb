class TallyType < ActiveRecord::Base
  belongs_to :user
  has_many :tallies, as: :tallyable
end
