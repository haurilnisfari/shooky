class Api::V1::UsersController < ApplicationController
  skip_before_action :authentication_access_token, only: :create

  def create
    #Create User >> Registration Endpoint
    user = UserService::CreateUserService.new(params[:username], params[:name], params[:email], params[:password], params[:password_confirmation], params[:bio]).call
    render json: { user: user.as_json(only: [:username, :name, :email]) }
  rescue StandardError => e 
    render json:{ error: e }, status: 400
  end
end