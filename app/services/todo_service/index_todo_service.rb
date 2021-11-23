class TodoService::IndexTodoService

  def call
    Todo.all 
  end

end