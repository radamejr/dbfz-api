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
        if current_user.admin
            @variant = @super.super_variants.create(variant_params)

            if @variant.persisted? 
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

    def show
        render json: @variant, status: :ok
    
    end

    def update
        if current_user.admin
            if @variant.update_attributes(variant_params)
                render json: {
                    #variant: @variant.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]}), potentially unneeded since state is updated for all characters
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

    def destroy
        if current_user.admin
            if @variant.destroy
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
