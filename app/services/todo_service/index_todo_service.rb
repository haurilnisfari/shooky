class TodoService::IndexTodoService

  def call
    User.all 
  end

end