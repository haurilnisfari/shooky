class Api::V1::SessionsController < ApplicationController
  skip_before_action :authentication_access_token, only: :create

  def create
    result = SessionService::CreateSessionService.new(params[:username], params[:password]).call
    if result[:status] == :ok
      user = result[:data]
      render json: { user: user.as_json(only: [:username, :name, :email, :access_token]) }
    else
      render json: {message: "Wrong Username or Password"}, status: 401
    end
  rescue StandardError => e 
    render json:{ error: e }, status: 400
  end
end
