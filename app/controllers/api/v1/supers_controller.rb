class Api::V1::SupersController < ApplicationController
  before_action :set_character
  before_action :set_supers, only: [:show, :update, :destroy]

  def index
    @supers = @character.supers.all

    render json: @supers, status: :ok
  end

  def create
    if logged_in? && admin?
      @super = @character.supers.create(super_params)

      if @super.persisted?
        render json: @super, status: :ok
      else
        render json: @super, status: :unprocessable_entity
      end
    else
      render json: {message: 'Not logged in as admin'}
    end
  end

  def show
    render json: @super, status: :ok

  end

  def destroy
    if logged_in? && admin?
      if @super.destroy
        render json: @super, status: :ok
      else
        head(:unprocessable_entity)
      end
    else
      render json: {message: 'Not logged in as admin'}
    end
  end

  def update
    if logged_in? && admin?
      if @super.update_attributes(super_params)
        render json: @super, status: :ok
      else
        render json: @super, status: :unprocessable_entity
      end
    else
      render json: {message: 'Not logged in as admin'}
    end
  end


  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_supers
    @character = Character.find(params[:character_id])
    @super = @character.supers.find(params[:id])
  end
  
  def super_params
    params.require(:super).permit(:name, :input, :startup, :active, :recovery, :advantage, :gaurd, :immune_to, :picture, :properties, :special_notes, :meter_used) 
  end
end
