class Api::V1::NormalsController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :destroy]
  before_action :set_character
  before_action :set_normals, only: [:show, :update, :destroy]

  def index
    @normals = @character.normals.all

    render json: @normals, status: :ok
  end

  def create
    if current_user.admin
      @normal = @character.normals.create(normal_params)

      if @normal.persisted?
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
    render json: @normal, status: :ok

  end

  def destroy
    if current_user.admin
      if @normal.destroy
        set_all_characters()
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
      if @normal.update_attributes(normal_params)
        set_all_characters()
        render json: {
          status: 200,
          message: 'Successfully updated!',
          characters: @characters
        }
      else
        render json: { 
          error: 'Failed to update character',
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

  def set_normals
    @character = Character.find(params[:character_id])
    @normal = @character.normals.find(params[:id])
  end

  def set_all_characters
    @characters = Character.includes(:normals, :assists, specials: [:special_variants], supers: [:super_variants])
    @characters = @characters.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]});
  end

  def normal_params
    params.require(:normal).permit(:input, :startup, :active, :recovery, :advantage, :gaurd, :immune_to, :picture, :properties, :special_notes, :move_type, :list_order) 
  end
end
