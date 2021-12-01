class Api::V1::TodosController < ApplicationController

  def index
    todos = TodoService::IndexTodoService.new(current_user).call
    if todos.empty?
      render json: {message: "You dont have any todo list"}
    else
      render json: { todos: todos.as_json(only: [:title, :description, :status])}
    end
  rescue StandardError => e
    render json: { error: e }
  end

  def create
    todo = TodoService::CreateTodoService.new(current_user, params[:title], params[:description], params[:status]).call
    render json: { todo: todo.as_json(only: [:title, :description, :status])}
  rescue StandardError => e 
    render json: { error: e}
  end

  def update
    todo = TodoService::UpdateTodoService.new(params[:id], params[:title], params[:description], params[:status], current_user).call
    if todo.nil?
      render json: {message: "You dont have access to update this todo list"}
    else
      render json: { todo: todo.as_json(only: [:title, :description, :status])}
    end
  rescue StandardError => e 
    render json: { error: e}
  end

  def destroy
    todo = TodoService::DestroyTodoService.new(params[:id], current_user).call
    if todo.nil?
      render json: {message: "You dont have access to delete this todo list"}
    else 
      render json: {todo: todo.as_json(only: [:title, :description, :status]), message: "Todo already deleted"}
    end
  rescue StandardError => e
    render json: { error: e }
  end


end