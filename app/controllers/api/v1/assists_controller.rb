class Api::V1::AssistsController < ApplicationController
    before_action :authenticate_user, only: [:update, :create, :destroy]
    before_action :set_character
    before_action :set_assists, only: [:show, :update, :destroy]
  
    def index
      @assists = @character.assists.all
  
      render json: @assists, status: :ok
    end
  
    def create
      if current_user.admin?
        @assist = @character.assists.create(assist_params)
    
        if @assist.persisted?
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
      render json: @assist, status: :ok
  
    end
  
    def destroy
      if current_user.admin
        if @assist.destroy
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
        if @assist.update_attributes(assist_params)
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
  
    def set_assists
      @character = Character.find(params[:character_id])
      @assist = @character.assists.find(params[:id])
    end

    def set_all_characters
      @characters = Character.all.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]})
    end 
    
    def assist_params
      params.require(:assist).permit(:startup, :blockstun, :active, :onscreen, :hitstop, :special_notes, :hit_stun, :picture) 
    end


end
