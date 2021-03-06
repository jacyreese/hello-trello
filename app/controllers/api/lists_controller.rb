class Api::ListsController < ApplicationController
  def create
    @list = List.new(list_params)
    if @list.save
      render json: @list
    else
      render json: @list.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      render json: @list
    else
      render json: @list.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    render 'show'
  end

  private

  def list_params
    params[:list].permit(:title, :board_id, :ord)
  end
end
