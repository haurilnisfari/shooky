class TodoService::IndexTodoService

  attr_reader :current_user
  def initialize(current_user)
    @current_user = current_user
  end

  def call
    Todo.where(user_id: current_user.id) 
  end

end