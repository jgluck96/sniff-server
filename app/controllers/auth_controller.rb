class AuthController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      render json: {user: UserSerializer.new(user), token:encode_token(user.id)}
    else
      render json: {errors: 'Please enter the correct email and/or password'}
    end
  end

  def auto_login

    if curr_user
      render json: {user: UserSerializer.new(curr_user)}
    else
      render json: {errors: 'Something went wrong'}
    end
  end
end
