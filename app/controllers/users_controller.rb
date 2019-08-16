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
        # send signup conf email
        UserMailer.signup_confirmation(user).deliver_later
        if params[:emailSignup] == true
          Newsletter.create(email: user.email)
        end

        token = encode_token(user.id)

        render json: {user: UserSerializer.new(user), token: token}
      else
        # byebug
        user_guest = User.find_by(email: params[:user][:email], guest: true)
        user_noguest = User.find_by(email: params[:user][:email], guest: false)
        # byebug
        if user_guest && !user_noguest
          user = User.new(user_params)
          user.save(validate: false)
          # user.update_attribute(:password, params[:user][:password])
          Cart.create({user_id: user.id})
          # send signup conf email
          UserMailer.signup_confirmation(user).deliver_later
          if params[:emailSignup] == true
            Newsletter.create(email: user.email)
          end

          token = encode_token(user.id)

          render json: {user: UserSerializer.new(user), token: token}
        else
        render json: {errors: 'Email already exists, please log in.'}
        end
      end
    end

  end


  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    user = User.find_by(id: params[:id], guest: false)
    # if params[:verified]
    #   if user.authenticate(params[:temp]) && user[:email] == params[:email] && user[:verified] == false
    #     authenticated = user.authenticate(params[:temp])
    #     authenticated.update_attribute(:password, params[:password])
    #     authenticated.update_attribute(:verified, params[:verified])
    #     render json: user
    #   else
    #     render json: {error: 'Enter the correct email and temporary password that was provided.'}
    #   end
    # else
    # byebug
    user[params.keys.first] = params[params.keys.first]
    user.save(:validate => false)
      # user.update_attribute((params.keys.first.to_sym), user_params)
      render json: user
    # end

  end

private

  def user_params
    params.require(:user).permit(:guest, :first_name, :verified, :last_name, :feedback, :email, :password, :mobile, :address)
  end

end
