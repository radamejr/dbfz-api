class Api::V1::AssistsController < ApplicationController
    before_action :set_character
    before_action :set_assists, only: [:show, :update, :destroy]
  
    def index
      @assists = @character.assists.all
  
      render json: @assists, status: :ok
    end
  
    def create
      @assist = @character.assists.create(assist_params)
  
      if @assist.persisted?
        render json: @assist, status: :ok
      else
        render json: @assist, status: :unproccessable_entity
      end
    end
  
    def show
      render json: @assist, status: :ok
  
    end
  
    def destroy
      
      if @assist.destroy
        render json: @assist, status: :ok
      else
        head(:unprocessable_entity)
      end
    end
  
    def update
  
      if @assist.update_attributes(assist_params)
        render json: @assist, status: :ok
      else
        render json: @assist, status: :unprocessable_entity
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
      params.require(:assist).permit(:startup, :blockstun, :active, :onscreen, :hitstop_block, :hitstop_hit, :special_notes, :picture) 
    end


end
