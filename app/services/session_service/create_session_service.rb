class SessionService::CreateSessionService

  attr_reader :username, :password

  def initialize(username, password)
    @username = username
    @password = password
  end

  def call
    user = User.find_by_username(username)
    if user
      if user.authenticate(password)
        return { status: :ok, data: user}
      else
        return { status: :error }
      end
    else
      return { status: :error }
    end
  end
  
end
