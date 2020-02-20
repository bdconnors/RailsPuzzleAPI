class Api::V1::Users_controller < ApplicationController
  before_action :current_user

  def index
    render json: User.all
  end

  def show
    render json: current_user
  end

  private

  def user_params
    params.require(:user).permit(:email,:password,:firstName,:lastName)
  end
end