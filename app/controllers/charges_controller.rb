require 'stripe'
class ChargesController < ApplicationController

  def create

    Stripe.api_key = ENV['STRIPE']

    begin
# byebug

      customer = Stripe::Customer.create(
        :email => params[:charge][:email],
        :source => params[:charge][:stripeToken]
      )

      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => params[:charge][:amount],
        :description => params[:charge][:description],
        :currency => params[:charge][:currency],
      })
      if params[:charge][:userId]

        @order = Order.create(confirmation: params[:charge][:confirmation], user_id: params[:charge][:userId], soaps: params[:charge][:soaps], total: params[:charge][:amount])
        user = User.find(params[:charge][:userId])
        user.cart.soaps = []
        render json: @order
      # else
      #   @guestorder = Guestorder.create(guestorder_params)
      #
      #   render json: @guestorder
      end

      render json: charge


    rescue Stripe::CardError => e
      render json: {message: 'oops'}, status: :not_acceptable
    end

  end

  private
  def guestorder_params
    params.require(:guestorder).permit(:first_name, :last_name, :email, :phone, :street_address, :apt, :city, :state, :zipcode, :feedback, :confirmation, :soaps, :price)
  end

end
