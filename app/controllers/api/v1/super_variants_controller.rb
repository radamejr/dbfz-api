class Api::V1::SuperVariantsController < ApplicationController
     before_action :authenticate_user, only: [:update, :create, :destroy]
    before_action :set_character
    before_action :set_super
    before_action :set_variants, only: [:show, :update, :destroy]

    def index
        @variants = @super.super_variants.all

        render json: @variants, status: :ok
    end

    def create
        if logged_in? && admin?
            @variant = @super.super_variants.create(variant_params)

            if @variant.persisted? 
                render json: @super, status: :ok
            else
                render json: @super, status: :unprocessable_entity
            end
        else
            render json: {message: 'Not logged in as admin'}
        end
    end

    def show
        render json: @variant, status: :ok
    
    end

    def update
        if logged_in? && admin?
            if @variant.update_attributes(variant_params)
                render json: @variant, status: :ok
            else
                render json: @variant, status: :unprocessable_entity
            end
        else
            render json: {message: 'Not logged in as admin'}
        end

    end

    def destroy
        if logged_in? && admin?
            if @variant.destroy
                render json: @variant, status: :ok
            else
                head(:unprocessable_entity)
            end
        else
            render json: {message: 'Not logged in as admin'}
        end
    end

    private
        
    def set_character
        @character = Character.find(params[:character_id])
    end
    
    def set_super
        @character = Character.find(params[:character_id])
        @super = @character.supers.find(params[:super_id])
    end

    def set_variants
        @character = Character.find(params[:character_id])
        @super = @character.supers.find(params[:super_id])
        @variant = @super.super_variants.find(params[:id])
    end
    
    def variant_params
        params.require(:super_variant).permit(:input_type, :startup, :active, :recovery, :advantage, :immune_to, :meter_used, :gaurd, :properties, :special_notes, :picture) 
    end
end
