require 'stripe'
class ChargesController < ApplicationController

  def create

    Stripe.api_key = ENV['STRIPE']

    begin
byebug
      customer = Stripe::Customer.create()

      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => params[:charge][:amount],
        :description => params[:charge][:description],
        :currency => params[:charge][:currency],
      })

    rescue Stripe::CardError => e
      render json: {message: 'oops'}, status: :not_acceptable
    end
  end

end
