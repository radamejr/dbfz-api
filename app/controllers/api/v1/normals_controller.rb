class Api::V1::NormalsController < ApplicationController
  before_action :set_character
  before_action :set_normals, only: [:show, :update, :destroy]

  def index
    @normals = @character.normals.all

    render json: @normals, status: :ok
  end

  def create
    @normal = @character.normals.create(normal_params)

    if @normal.persisted?
      render json: @normal, status: :ok
    else
      render json: @normal, status: :unproccessable_entity
    end
  end

  def show
    render json: @normal, status: :ok

  end

  def destroy
    
    if @normal.destroy
      render json: @normal, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def update

    if @normal.update_attributes(normal_params)
      render json: @normal, status: :ok
    else
      render json: @normal, status: :unprocessable_entity
    end
  end

  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_normals
    @character = Character.find(params[:character_id])
    @normal = @character.normals.find(params[:id])
  end
  
  def normal_params
    params.require(:normal).permit(:input, :startup_frames, :active_frames, :recovery_on_hit, :recovery_on_block, :recovery_on_whiff, :cancellable, :blockstun, :immune_to, :picture) 
  end
end
