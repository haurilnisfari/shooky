class TodoService::IndexTodoService

  attr_reader :current_user
  def initialize(current_user)
    @current_user = current_user
  end

  def call
    todos = Todo.where(user_id: current_user.id)
    if todos
      return {status: :ok, data: todos}
    else
      return {status: :error}
    end
  end

end