class TodoService::DestroyTodoService

  def initialize(id)
    @id = id
  end

  def call
    todo = Todo.find_by id: @id
    todo.destroy
  end

end
