class TodoService::UpdateTodoService

  attr_reader :id, :title, :description, :status, :user_id

  def initialize(id, title, description, status, user_id)
    @id = id
    @title = title
    @description = description
    @status = status
    @user_id = user_id
  end

  def call
    todo = Todo.find_by id: id
    todo.update(id: id, title: title, description: description, status: status, user_id: user_id)
    todo
  end

end