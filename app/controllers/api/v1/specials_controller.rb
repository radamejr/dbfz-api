class Api::V1::SpecialsController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :destroy]
  before_action :set_character
  before_action :set_specials, only: [:show, :update, :destroy]

  def index
    @specials = @character.specials.all

    render json: @specials, status: :ok
  end

  def create
    if current_user.admin
      @special = @character.specials.create(special_params)

      if @special.persisted?
        render json: {
          status: 200,
          message: 'Successfully created!'
        }
      else
        render json: {
          status: 403,
          message: 'Unabled to create!'
        }
      end
    else
      render json: { 
        error: 'Not logged in as admin',
        status: 401,
      }
    end
  end

  def show
    render json: @special, status: :ok

  end

  def destroy
    if current_user.admin
      if @special.destroy
        render json: {
          status: 200,
          message: 'Successfully destroyed!'
        }
      else
        render json: {
          status: 403,
          message: 'Unabled to delete!'
        }
      end
    else
      render json: { 
        error: 'Not logged in as admin',
        status: 401,
      }
    end
  end

  def update
    if current_user.admin
      if @special.update_attributes(special_params)
        render json: {
          #special: @special.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]}), potentially unneeded since state is updated for all characters
          status: 200,
          message: 'Successfully updated!'
        }
      else
        render json: { 
          error: 'Unable to update!',
          status: 401,
        }
      end
    else
      render json: { 
        error: 'Not logged in as admin',
        status: 401,
      }
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
