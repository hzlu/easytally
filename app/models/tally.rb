# == Schema Information
#
# Table name: tallies
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  remark         :string(255)
#  amount         :decimal(9, 2)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  tallyable_id   :integer
#  tallyable_type :string(255)
#
# Indexes
#
#  index_tallies_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_6fc4dfaae8  (user_id => users.id)
#

class Tally < ActiveRecord::Base
  belongs_to :user
  belongs_to :tallyable, polymorphic: true

  validates :amount, :presence => true

  scope :income, -> { where('amount >= 0') }
  scope :expend, -> { where('amount < 0') }
end
