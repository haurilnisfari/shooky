class TodoService::DestroyTodoService

  def initialize(id, current_user)
    @id = id
    @current_user = current_user
  end

  def call
    todo = Todo.where(user_id: @current_user.id).find_by id: @id
    if todo.nil?
      return todo
    else
      todo.destroy
      todo
    end
  end

end
