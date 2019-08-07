class FeedbacksController < ApplicationController

  def index
    @feedback = Feedback.all
    render json: @feedback
  end
  
  def create
    UserMailer.feedback(params[:email], params[:message]).deliver_later
    render json: {message: 'Thank you for your feedback!'}
  end
end
