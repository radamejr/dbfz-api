class Api::V1::SupersController < ApplicationController
  before_action :set_character
  before_action :set_supers, only: [:show, :update, :destroy]

  def index
    @super = @character.supers.all

    render json: {status: "SUCCESS", message: "Showing supers", data: @super}, status: :ok
  end

  def create
    @super = @character.supers.create(super_params)

    if @super.persisted?
      render json: {status: "SUCCESS", message: "Added super", data: @super}, status: :ok
    else
      render json: {status: "FAILED", message: "Could not add super", data: @super}, status: :unproccessable_entity
    end
  end

  def show
    render json: {status: "SUCCESS", message: "Showing super", data: @super}, status: :ok

  end

  def destroy
    
    if @super.destroy
      render json: {status: "SUCCESS", message: "Deleted super", data: @super}, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def update

    if @super.update_attributes(super_params)
      render json: {status: "SUCCESS", message: "Updated super", data: @super}, status: :ok
    else
      render json: {status: "SUCCESS", message: "Can't Update super", data: @super}, status: :unprocessable_entity
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
    params.require(:super).permit(:name, :input, :startup_frames, :active_frames, :recovery_on_hit, :recovery_on_block, :recovery_on_whiff, :cancellable, :blockstun, :immune_to, :meter_used) 
  end
end
