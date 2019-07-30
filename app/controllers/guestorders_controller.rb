class GuestordersController < ApplicationController

  def index
    @guestorders = Guestorder.all
    render json: @guestorders
  end

  def create
# byebug
    @guestorder = Guestorder.create(guestorder_params)

    render json: @guestorder
  end

  private
  def guestorder_params
    params.require(:guestorder).permit(:first_name, :confirmation, :last_name, :email, :phone, :street_address, :apt, :city, :state, :zipcode, :soaps, :price, :feedback)
  end
end
