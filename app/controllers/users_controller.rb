class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, include: ['cart.soaps', 'orders']
  end

  def create


    if params[:guest] === true
      user = User.new(guest: params[:guest], first_name: params[:first_name], last_name: params[:last_name], feedback: params[:feedback], email: params[:email], mobile: params[:phone])
      user.save(validate: false)
      Cart.create({user_id: user.id})
      render json: user
    else
      user = User.new(user_params)
      if user.valid?
        user = User.create(user_params)
        Cart.create({user_id: user.id})


        token = encode_token(user.id)

        render json: {user: UserSerializer.new(user), token: token}
      else
        # byebug
        # if(user.errors[:email]) {
        #   render
        # }
        render json: {errors: user.errors.full_messages}
      end
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
