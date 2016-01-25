class Tally < ActiveRecord::Base
  belongs_to :user
  belongs_to :tally_type
end
