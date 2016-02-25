# == Schema Information
#
# Table name: income_types
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_income_types_on_name     (name)
#  index_income_types_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_5702206846  (user_id => users.id)
#

class IncomeType < ActiveRecord::Base
  belongs_to :user
  has_many :income_tallies, :as => :tallyable, :class_name => 'Tally'
end
