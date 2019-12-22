class Api::V1::VariantsController < ApplicationController
    before_action :set_character
    before_action :set_special
    before_action :set_variants, only: [:show, :update, :destroy]

    def index
        @variants = @special.variants.all

        render json: @variants, status: :ok
    end

    def create
        @variant = @special.variants.create(variant_params)

        if @variant.persisted? 
            render json: @special, status: :ok
        else
            render json: @special, status: :unproccessable_entity
        end
    end

    def show
        render json: @special, status: :ok
    
    end

    def update
        if @variant.update_attributes(variant_params)
            render json: @variant, status: :ok
        else
            render json: @variant, status: :unprocessable_entity
        end
    end

    def destroy
        if @variant.destroy
            render json: @variant, status: :ok
        else
            head(:unprocessable_entity)
        end
    end

    private
        
    def set_character
        @character = Character.find(params[:character_id])
    end
    
    def set_special
        @character = Character.find(params[:character_id])
        @special = @character.specials.find(params[:special_id])
    end

    def set_variants
        @character = Character.find(params[:character_id])
        @special = @character.specials.find(params[:special_id])
        @variant = @special.variants.find(params[:id])
    end
    
    def variant_params
        params.require(:variant).permit(:input_type, :startup, :active, :recovery, :advantage, :immune_to, :meter_used, :gaurd, :properties, :special_notes, :picture) 
    end
end
