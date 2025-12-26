class ItemsController < ApplicationController
    before_action :set_todo
  
    def index
      render json: @todo.items, status: :ok
    end
  
    def create
      @item = @todo.items.create!(item_params)
      render json: @item, status: :created
    end
  
    private
  
    def item_params
      params.permit(:name, :done)
    end
  
    def set_todo
      @todo = Todo.find(params[:todo_id])
    end
  end