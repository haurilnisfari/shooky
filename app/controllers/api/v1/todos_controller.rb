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
end

def destroy
end


end