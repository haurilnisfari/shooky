class ApplicationController < ActionController::API
  before_action :authentication_access_token

  def authentication_access_token
    header = request.headers[:HTTP_API_ACCES_TOKEN]
    #check header available
    if header.present?
      #check header valid or not
      access_token_values = User.all.pluck(:access_token)
      if access_token_values.include? header
        @user_valid = User.find_by(access_token: header)
      else
        render json: {message: "Your header is not valid"}, status: 401
        return
      end
    else
      render json: {message: "You dont have access"}, status: 401
      return
    end
  end
  
  def current_user
    @user_valid
  end

end
