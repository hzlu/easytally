json.tally_data do
  json.today_income current_user.tallies.income.today.sum(:amount)
  json.today_expend current_user.tallies.expend.today.sum(:amount)
  json.week_income current_user.tallies.income.by_week.sum(:amount)
  json.week_expend current_user.tallies.expend.by_week.sum(:amount)
  json.month_income current_user.tallies.income.by_month.sum(:amount)
  json.month_expend current_user.tallies.expend.by_month.sum(:amount)
  json.year_income current_user.tallies.income.by_year.sum(:amount)
  json.year_expend current_user.tallies.expend.by_year.sum(:amount)
end

json.income_types current_user.income_types, :id, :name

json.tally_types current_user.tally_types, :id, :name
