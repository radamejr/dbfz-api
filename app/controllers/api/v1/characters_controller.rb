class Api::V1::CharactersController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :destroy]
  before_action :set_character, only: [:update, :destroy, :show]

  def index
    @characters = Character.all.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]})

    render json: JSON.pretty_generate(@characters), status: :ok
  end

  def create
    if current_user.admin?
      @character = Character.new(char_params)
      if @character.save
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

  def destroy
    
    if current_user.admin
      if @character.destroy
        render json: {
          status: 200,
          message: 'Successfully deleted!'
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

  def show
    render json: @character, status: :ok
  end

  def update
    if current_user.admin
      if @character.update_attributes(char_params)
        render json: {
          #character: @character.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]}), potentially unneeded since state is updated for all characters
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
   @character = Character.find(params[:id])
  end

  def char_params
    params.require(:character).permit(:name, :dlc, :discord_link, :combo_doc_link, :icon, :character_picture, :twitter_tag, :about)
  end

end
