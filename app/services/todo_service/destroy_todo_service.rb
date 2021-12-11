class TodoService::DestroyTodoService

  attr_reader :id, :current_user
  def initialize(id, current_user)
    @id = id
    @current_user = current_user
  end

  def call
    todo = Todo.find_by(id: id, user_id: current_user.id)
    if todo
      todo.destroy
      return {status: :ok, data: todo}
    else
      return {status: :error}
    end
  end
end
