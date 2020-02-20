class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def user_params
    params.require(:user).permit(:email,:password,:firstName,:lastName)
  end
end