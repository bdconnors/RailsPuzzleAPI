class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    @json = JSON.parse(request.body.read)
    password = @json['password']
    hash = Digest::SHA2.new(256).hexdigest password
    @user = User.new
    @user.email = @json['email']
    @user.password = hash
    @user.firstName = @json['firstName']
    @user.lastName = @json['lastName']
    @user.puzzles = Array.new
    @user.save
    render :json => @user.as_json(:except=>[:password])
  end
  def update
    @id = params[:id]
    @body = JSON.parse(request.body.read)
    user = User.find_by(_id: @id)
    user.update_attributes puzzles: @body
    render json: user
  end
  def show
    @id = params[:id]
    @user = User.find_by(id: @id)
    render :json => @user.as_json(:except=>[:password])
  end
end