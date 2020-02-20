class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    @json = JSON.parse(request.body.read)
    user = User.new
    user.email = @json['email']
    user.password = @json['password']
    user.firstName = @json['firstName']
    user.lastName = @json['lastName']
    user.save
    render user.to_json(:except=>password)
  end
  def update
    @id = params[:id]
    @body = JSON.parse(request.body.read)
    user = User.find_by(_id: @id)
    user.puzzles << @body
    render json: user
  end
  def show
    @id = params[:id]
    user = User.find_by(_id: @id)
    render json: user
  end
end