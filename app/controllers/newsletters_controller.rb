class NewslettersController < ApplicationController

  def index
    @newsletter = Newsletter.all
    render json: @newsletter
  end

  def create
    found = Newsletter.find_by(email: params[:email])
    if found
      render json: {message: 'You are already enrolled.'}
    else
      newsletter = Newsletter.create(email: params[:email])
      UserMailer.newsletter(newsletter[:email]).deliver_later
      render json: newsletter
    end
  end
end
