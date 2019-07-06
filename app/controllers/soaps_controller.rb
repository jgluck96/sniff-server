class SoapsController < ApplicationController

  def index
    @soaps = Soap.all
    render json: @soaps
  end

  def create
    @soap = Soap.create(soap_params)
    render json: @soap
  end

private

  def soap_params
    params.require(:soap).permit(:base, :fragrance1, :fragrance2, :fragrance3, :addon, :price, :user_id)
  end

end
