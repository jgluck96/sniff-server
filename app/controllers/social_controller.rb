class SocialController < ApplicationController

  def create
    user = User.find_by(email: params[:user][:email], guest: false)
    user_guest = User.find_by(email: params[:user][:email], guest: true)

    if user
      byebug
      render json: {user: UserSerializer.new(user), token:encode_token(user.id)}
    else
      # when you create social signup, send email verification to their email
      # they click on it and it brings them to /verify
      # they change their password from there with a patch
      byebug
      if user_guest
        user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password], verified: false, guest: false)
        user.save(validate: false)
        # user.update_attribute(:password, params[:user][:password])
        Cart.create({user_id: user.id})
      else
        user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], password: params[:user][:password], verified: false, guest: false)
        Cart.create({user_id: user.id})
      end
      # UserMailer.signup_confirmation(user).deliver_later
      UserMailer.verification(user, params[:user][:password]).deliver_later
      token = encode_token(user.id)
      render json: {user: UserSerializer.new(user), token: token}
    end
  end

end
