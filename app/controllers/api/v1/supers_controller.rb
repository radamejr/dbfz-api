class Api::V1::SupersController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :destroy]
  before_action :set_character
  before_action :set_supers, only: [:show, :update, :destroy]
  
  def index
    @supers = @character.supers.all

    render json: @supers, status: :ok
  end

  def create
    if current_user.admin
      @super = @character.supers.create(super_params)

      if @super.persisted?
        set_all_characters()
        render json: {
          status: 200,
          message: 'Successfully created!',
          characters: @characters
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
    render json: @super, status: :ok
  end

  def destroy
    if current_user.admin
      set_all_characters()
      if @super.destroy
        render json: {
          status: 200,
          message: 'Successfully deleted!',
          characters: @characters
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
      if @super.update_attributes(super_params)
        set_all_characters()
        render json: {
          status: 200,
          message: 'Successfully updated!',
          characters: @characters
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

  def set_supers
    @character = Character.find(params[:character_id])
    @super = @character.supers.find(params[:id])
  end

  def set_all_characters
    @characters = Character.includes(:normals, :assists, specials: [:special_variants], supers: [:super_variants])
    @characters = @characters.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]});
  end
  
  def super_params
    params.require(:super).permit(:name, :input, :startup, :active, :recovery, :advantage, :gaurd, :immune_to, :picture, :properties, :special_notes, :meter_used, :raw_damage, :scaled_damage) 
  end
end
