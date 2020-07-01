class AuthenticationController < ApplicationController
  def login
    @user = User.find_by(username: params[:username])

    if !@user
      render json: { error: "No user by that name" }, status: :unauthorized
    else
      if !@user.authenticate params[:password]
        render json: { error: "WRONG P-WORD, BRAH" }, status: :unauthorized
      else
        payload = {
          user_id: @user.id
        }
        secret = Rails.application.secret_key_base
        token = JWT.encode payload, secret

        render json: { token: token }, status: :created
      end
    end
  end
end
