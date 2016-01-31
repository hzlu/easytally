class TalliesController < ApplicationController
  def home
    @tally = Tally.new
    @income_type = IncomeType.new
    @tally_type = TallyType.new
  end

  def index
  end

  def tally_data
  end

  def create
    @tally = current_user.tallies.build(tally_params)
    if @tally.save
      return render json: @tally.to_json
    else
      return render plain: 'error'
    end
  end

  def destroy
  end

  private
  def filter_params
    params.require(:tally).permit(:amount, :remark, :tallyable_id, :tallyable_type)
  end

  def tally_params
    t_params = filter_params
    if params[:flag] == 'expend'
      t_params[:amount] = - t_params[:amount].to_i.abs
    end
    t_params
  end

end
