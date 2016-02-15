require 'rails_helper'

RSpec.describe Tally, type: :model do
  it 'is invalid without amount' do
    tally = FactoryGirl.build(:tally, amount: nil)
    tally.valid?
    expect(tally.errors[:amount].size).to eq(1)
  end

  it 'is valid without remark' do
    tally = FactoryGirl.build(:tally, remark: nil)
    expect(tally).to be_valid
  end

  context 'scope amount' do
    before :each do
      @tally_a = Tally.create!(amount: 10)
      @tally_b = Tally.create!(amount: -10)
      @tally_c = Tally.create!(amount: 0)
    end
    it 'scope income with amount greater than or equal to 0' do
      expect(Tally.income).to eq([@tally_a, @tally_c])
    end
    it 'scope expend with amount less than 0' do
      expect(Tally.expend).to eq([@tally_b])
    end
  end
end
