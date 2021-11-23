class Api::V1::TodosController < ApplicationController

  def index
    todos = TodoService::IndexTodoService.new.call
    render json: { todos: todos.as_json(only: [:title, :description, :status])}
  rescue StandardError => e
    render json: { error: e }
  end

  def create
    todo = TodoService::CreateTodoService.new(params[:title], params[:description], params[:status], params[:user_id]).call
    render json: { todo: todo.as_json(only: [:title, :description, :status])}
  rescue StandardError => e 
    render json: { error: e}
  end

  def update
    todo = TodoService::UpdateTodoService.new(params[:id], params[:title], params[:description], params[:status], params[:user_id]).call
    render json: { todo: todo.as_json(only: [:title, :description, :status])}
  rescue StandardError => e 
    render json: { error: e}
  end

  def destroy
    todo = TodoService::DestroyTodoService.new(params[:id]).call
    render json: {todo: todo.as_json(only: [:title, :description, :status]), message: "Todo already deleted"}
  rescue StandardError => e
    render json: { error: e }
  end


end