class TodoService::CreateTodoService

  attr_reader :title, :description, :status, :user_id

  def initialize(title, description, status, user_id)
    @title = title
    @description = description
    @status = status
    @user_id = user_id
  end

  def call
    todo = Todo.new(title: title, description: description, status: status, user_id: user_id)
    todo.save
    todo
  end

end