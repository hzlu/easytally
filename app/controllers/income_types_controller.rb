class IncomeTypesController < ApplicationController
  def index
    @income_types = current_user.income_types
  end

  def create
    @type = current_user.income_types.build(type_params)
    if @type.save
      render json: { id: @type.id, name: @type.name }
    else
      render json: { msg: 'fail' }
    end
  end

  def destroy
    @type = current_user.income_types.find params[:id]
    if @type.destroy
      render json: { msg: 'success' }
    else
      render json: { msg: 'fail' }
    end
  end

  private
  def type_params
    params.require(:income_type).permit(:name)
  end
end
