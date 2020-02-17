class Api::V1::LoginController < ApplicationController
  before_action only: [:create]
# POST /login
  def create
    body = JSON.parse request.body.read
    account = User.find_by(email: body['email']).to_json(:except=> :password)
    token = TokenBuilder.encode(account)
    render json: {token:token}
  end
end