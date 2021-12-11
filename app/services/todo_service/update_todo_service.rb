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
    #pakai find_by aja, kondisinya yang banyak
    # balikan dari service itu bentuknya hash
    # minimal gini
    # { status: :ok } atau { status: :error }
    #
    # kalau butuh data lain tinggal tambahin hash-nya, misal
    # { status: :ok, data: todo }
    # { status: :error, message: "You don't have access"}

  todo = Todo.find_by(id: id, user_id: current_user.id)
  if todo
    todo.update(title: title, description: description, status: status)
    return {status: :ok, data: todo}
  else
    return {status: :error}
  end
end

end