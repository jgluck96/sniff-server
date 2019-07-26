class SoapsController < ApplicationController

  def index
    @soaps = Soap.all
    render json: @soaps
  end

  def create
    # byebug
    @soap = Soap.create(soap_params)
    render json: @soap
  end

  def update

    @soap = Soap.find(params[:id])
    # byebug

    @soap.update(quantity: params[:quantity], price: params[:price])
    soaps = @soap.cart.soaps
    # new_array = @soap.cart.soaps.insert(soap_idx, @soap)
    # new_array.pop()
    # @soap.cart.soaps = new_array
# byebug
    render json: soaps
  end

  def destroy
    @soap = Soap.find(params[:id])
    soaps_cart = @soap.cart
    @soap.destroy

    render json: soaps_cart.soaps
  end

private

  def soap_params
    params.require(:soap).permit(:base, :quantity, :fragrance1, :fragrance2, :fragrance3, :addon, :price, :cart_id)
  end

end
