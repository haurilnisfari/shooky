class TodoService::CreateTodoService

  attr_reader :current_user, :title, :description, :status

  def initialize(current_user, title, description, status)
    @current_user = current_user
    @title = title
    @description = description
    @status = status
  end

  def call
    todo = Todo.new(title: title, description: description, status: status)
    todo.user_id = current_user.id
    todo.save
    todo
  end

end