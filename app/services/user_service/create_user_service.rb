class UserService::CreateUserService

  attr_reader :username, :name, :email, :password, :password_confirmation, :bio

  def initialize(username, name, email, password, password_confirmation, bio)
    @username = username
    @name = name
    @email = email
    @password = password
    @password_confirmation = password_confirmation
    @bio = bio
  end

  def call
    prev_user = User.find_by username: username
    raise StandardError, 'Username already exists' if prev_user.present?

    user = User.new(username: username, name: name, email: email, password: password, password_confirmation: password_confirmation, bio: bio)
    user.access_token = user.generate_token
    user.save
    user

  end
end
