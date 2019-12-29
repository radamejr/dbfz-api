class Api::V1::CharactersController < ApplicationController
  before_action :set_character, only: [:update, :destroy, :show]

  def index
    @characters = Character.all

    render json: @characters, status: :ok
  end

  def create
    @character = Character.new(char_params)

    if logged_in? && admin?
      if @character.save
        render json: :ok
      else
        render json: :unprocessable_entity
      end
    else
      render json: {message: 'Not logged in as admin'}
    end

  end

  def destroy
    
    if logged_in? && admin?
      if @character.destroy
        head(:ok)
      else
        head(:unprocessable_entity)
      end
    else
      rrender json: {message: 'Not logged in as admin'}
    end


  end

  def show
    render json: @character, status: :ok

  end

  def update
    if logged_in? && admin?
      if @character.update_attributes(char_params)
        render json: @character, status: :ok
      else
        render json: @character, status: :unprocessable_entity
      end
    else
      render json: {message: 'Not logged in as admin'}
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
