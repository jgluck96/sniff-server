class PasswordResetsController < ApplicationController

  # def create
  #   user = User.find_by(params[:id])
  #   user.send_password_reset if user
  #   redirect_to new_session_path
  # end
  #
  def verify
    user = User.find_by(email: params[:email], guest: false)
    if user.authenticate(params[:temp]) && user[:email] == params[:email] && user[:verified] == false
      authenticated = user.authenticate(params[:temp])
      authenticated.update_attribute(:password, params[:password])
      authenticated.update_attribute(:verified, params[:verified])
      render json: user
    else
      render json: {error: 'Enter the correct email and temporary password that was provided.'}
    end
  end

end
