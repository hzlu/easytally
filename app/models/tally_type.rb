# == Schema Information
#
# Table name: tally_types
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tally_types_on_name     (name)
#  index_tally_types_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_5ac61f07b2  (user_id => users.id)
#

class TallyType < ActiveRecord::Base
  belongs_to :user
  has_many :tallies, as: :tallyable
end
