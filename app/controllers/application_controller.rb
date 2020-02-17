class ApplicationController < ActionController::API
  def index
    @greeting = 'hello world'
  end

  private

  def current_user
    @user = User.find_by(id: params[:id])
  end
end

