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
      @order = Order.create(confirmation: params[:charge][:confirmation], user_id: params[:charge][:userId], soaps: params[:charge][:soaps], total: params[:charge][:amount])
      user = User.find(params[:charge][:userId])
      user.cart.soaps = []
      render json: @order

    rescue Stripe::CardError => e
      render json: {message: 'oops'}, status: :not_acceptable
    end

  end

end
