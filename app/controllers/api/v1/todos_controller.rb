class Api::V1::TodosController < ApplicationController

  def index
    result = TodoService::IndexTodoService.new(current_user).call
    if result[:status] == :ok
      todos = result[:data] 
      render json: { todos: todos.as_json(only: [:title, :description, :status])}
    else
      render json: {message: "You dont have any todo list"}
    end
  rescue StandardError => e
    render json: { error: e }
  end

  def create
    result = TodoService::CreateTodoService.new(current_user, params[:title], params[:description], params[:status]).call
    if result[:status] == :ok
      todo = result[:data]
      render json: { todo: todo.as_json(only: [:title, :description, :status])}
    else
      render json: {message: "Failed to create todo list"}
    end
  rescue StandardError => e 
    render json: { error: e}
  end

  def update
    result = TodoService::UpdateTodoService.new(params[:id], params[:title], params[:description], params[:status], current_user).call
    if result[:status] == :ok
      todo = result[:data]
      render json: { todo: todo.as_json(only: [:title, :description, :status])}
    else
      render json: {message: "You dont have access to update this todo list"}
    end
  rescue StandardError => e 
    render json: { error: e}
  end

  def destroy
    result = TodoService::DestroyTodoService.new(params[:id], current_user).call
    if result[:status] == :ok
      todo = result[:data]
      render json: {todo: todo.as_json(only: [:title, :description, :status]), message: "Todo already deleted"}
    else 
      render json: {message: "You dont have access to delete this todo list"}
    end
  rescue StandardError => e
    render json: { error: e }
  end


end