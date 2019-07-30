class CartsController < ApplicationController

  def index
    @cart = Cart.all
    render json: @cart
  end

  def create(user_id)

    @cart = Cart.create({user_id: user_id})
    
    render json: @cart
  end


  private
  def cart_params
    params.require(:cart).permit(:user_id)
  end
end
