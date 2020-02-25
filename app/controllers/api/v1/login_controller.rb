class Api::V1::LoginController < ApplicationController
  before_action only: [:create]
# POST /login
  def create
    @body = JSON.parse request.body.read
    @result = -1
    @password = @body['password']
    unless @body['email'] == "" && @body['password'] == ""
      @user = User.find_by(email: @body['email'])
      unless @user.nil?
        @hash = Digest::SHA2.new(256).hexdigest @password
        @userHash = @user.password
        if @hash == @userHash
          @result = @user.as_json(:except => [:password])
        end
      end
    end
    render :json =>{result: @result}
  end
end