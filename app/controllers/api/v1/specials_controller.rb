class Api::V1::SpecialsController < ApplicationController
  before_action :authenticate_v1_user, only: [:update, :create, :destroy]
  before_action :set_character
  before_action :set_specials, only: [:show, :update, :destroy]

  def index
    @specials = @character.specials.all

    render json: @specials, status: :ok
  end

  def create
    if logged_in? && admin?
      @special = @character.specials.create(special_params)

      if @special.persisted?
        render json: @special, status: :ok
      else
        render json: @special, status: :unprocessable_entity
      end
    else
      render json: {message: 'Not logged in as admin'}
    end
  end

  def show
    render json: @special, status: :ok

  end

  def destroy
    if logged_in? && admin?
      if @special.destroy
        render json: @special, status: :ok
      else
        head(:unprocessable_entity)
      end
    else
      render json: {message: 'Not logged in as admin'}
    end
  end

  def update
    if logged_in? && admin?
      if @special.update_attributes(special_params)
        render json: @special, status: :ok
      else
        render json: @special, status: :unprocessable_entity
      end
    else
      render json: {message: 'Not logged in as admin'}
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
    params.require(:special).permit(:name, :input, :special_notes, :picture) 
  end
end
