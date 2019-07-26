class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, include: ['cart.soaps', 'orders']
  end

  def create
    user = User.new(user_params)

    if user.valid?
      user = User.create(user_params)
      Cart.create({user_id: user.id})


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
    params.require(:user).permit(:guest, :first_name, :last_name, :feedback, :email, :password, :mobile, :address)
  end

end
