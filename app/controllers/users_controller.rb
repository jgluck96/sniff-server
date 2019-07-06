class UsersController < ApplicationController


  def create
    user = User.find(params[:email]) || User.create(user_params)

    if user.valid?
      token = encode_token(user.id)

      render json: {user: UserSerializer.new(user), token: token}
    else
      render json: {errors: 'Fill out correct info'}
    end
  end


  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user
  end

private

  def user_params
    params.require(:user).permit(:guest, :full_name, :email, :password, :mobile, :address)
  end

end
