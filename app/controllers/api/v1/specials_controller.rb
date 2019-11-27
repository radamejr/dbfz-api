class Api::V1::SpecialsController < ApplicationController
  before_action :set_character
  before_action :set_specials, only: [:show, :update, :destroy]

  def index
    @specials = @character.specials.all

    render json: @specials, status: :ok
  end

  def create
    @special = @character.specials.create(special_params)

    if @special.persisted?
      render json: @special, status: :ok
    else
      render json: @special, status: :unproccessable_entity
    end
  end

  def show
    render json: @special, status: :ok

  end

  def destroy
    
    if @special.destroy
      render json: @special, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  def update

    if @special.update_attributes(special_params)
      render json: @special, status: :ok
    else
      render json: @special, status: :unprocessable_entity
    end
  end


  private

  def set_character
    @character = Character.find(params[:character_id])
  end

  def set_specials
    @character = Character.find(params[:character_id])
    @special = @character.specials.find(params[:id])
  end
  
  def special_params
    params.require(:special).permit(:name, :input, :startup_frames, :active_frames, :recovery_on_hit, :recovery_on_block, :recovery_on_whiff, :cancellable, :blockstun, :immune_to, :meter_used) 
  end
end