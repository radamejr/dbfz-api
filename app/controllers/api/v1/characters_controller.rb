class Api::V1::CharactersController < ApplicationController
  before_action :authenticate_user, only: [:update, :create, :destroy]
  before_action :set_character, only: [:update, :destroy, :show]

  def index
    set_all_characters()

    render json: {
      status: 200,
      characters: @characters
    }
  end

  def create
    if current_user.admin?
      @character = Character.new(char_params)
      if @character.save
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

  def destroy
    
    if current_user.admin
      if @character.destroy
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

  def show
    render json: @character, status: :ok
  end

  def update
    if current_user.admin
      if @character.update_attributes(char_params)
        set_all_characters()
        render json: {
          characters: @characters,
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

  def set_all_characters
    @characters = Character.includes(:normals, :assists, specials: [:special_variants], supers: [:super_variants])
    @characters = @characters.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]});
  end
  
  def char_params
    params.require(:character).permit(:name, :dlc, :discord_link, :combo_doc_link, :icon, :character_picture, :twitter_tag, :about)
  end

end
