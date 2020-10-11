class Api::V1::AssistsController < ApplicationController
    before_action :authenticate_user, only: [:update, :create, :destroy]
    before_action :set_character
    before_action :set_assists, only: [:show, :update, :destroy]
  
    def index
      @assists = @character.assists.all
  
      render json: @assists, status: :ok
    end
  
    def create
      if logged_in? && admin?
        @assist = @character.assists.create(assist_params)
    
        if @assist.persisted?
          render json: @assist, status: :ok
        else
          render json: @assist, status: :unprocessable_entity
        end
      else
        render json: {message: 'Not logged in as admin'}
      end
    end
  
    def show
      render json: @assist, status: :ok
  
    end
  
    def destroy
      if logged_in? && admin?
        if @assist.destroy
          render json: @assist, status: :ok
        else
          head(:unprocessable_entity)
        end
      else
        render json: {message: 'Not logged in as admin'}
      end

    end
  
    def update
      if logged_in? && admin?
        if @assist.update_attributes(assist_params)
          render json: @assist, status: :ok
        else
          render json: @assist, status: :unprocessable_entity
        end
      else
          render json: {message: 'Not logged in as admin'}
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
    
    def assist_params
      params.require(:assist).permit(:startup, :blockstun, :active, :onscreen, :hitstop, :special_notes, :hit_stun, :picture) 
    end


end
