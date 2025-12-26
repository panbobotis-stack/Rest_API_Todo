class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = current_user.todos
    render json: @todos
  end

  # POST /todos
  def create
    # Εδώ γίνεται η μαγεία: συνδέει το Todo με τον current_user
    @todo = current_user.todos.create!(todo_params)
    render json: @todo, status: :created
  end

  # GET /todos/:id
  def show
    render json: @todo
  end

  # PUT /todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:title)
  end

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end
end