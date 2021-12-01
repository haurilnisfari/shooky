class TodoService::UpdateTodoService

  attr_reader :id, :title, :description, :status, :current_user

  def initialize(id, title, description, status, current_user)
    @id = id
    @title = title
    @description = description
    @status = status
    @current_user = current_user
  end

  def call
    todo = Todo.where(user_id: current_user.id).find_by id: id
    if todo.nil?
      return todo
    else
      todo.update(title: title, description: description, status: status)
      todo
    end
  end

end