class Api::V1::UsersController < ApplicationController
  skip_before_action :authentication_access_token, only: :create

  def create
    #Create User >> Registration Endpoint
    result = UserService::CreateUserService.new(params[:username], params[:name], params[:email], params[:password], params[:password_confirmation], params[:bio]).call
    if result[:status] == :ok
      user = result[:data]
      render json: { user: user.as_json(only: [:username, :name, :email]) }
    else
      render json: {message: "Failed to create user"}
    end
  rescue StandardError => e 
    render json:{ error: e }, status: 400
  end
end