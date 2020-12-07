class Api::V1::SpecialVariantsController < ApplicationController
    before_action :authenticate_user, only: [:update, :create, :destroy]
    before_action :set_character
    before_action :set_special
    before_action :set_variants, only: [:show, :update, :destroy]

    def index
        @variants = @special.special_variants.all

        render json: @variants, status: :ok
    end

    def create
        if current_user.admin
            @variant = @special.special_variants.create(variant_params)

            if @variant.persisted? 
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
        render json: @variant, status: :ok
    end

    def update
        if current_user.admin
            if @variant.update_attributes(variant_params)
                set_all_characters()
                render json: {
                    status: 200,
                    message: 'Successfully updated!',
                    characters: @characters
                }
            else
                render json: {
                    status: 403,
                    message: 'Unabled to update!'
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
        @variant = @special.special_variants.find(params[:id])
    end
    
    def set_all_characters
        @characters = Character.includes(:normals, :assists, specials: [:special_variants], supers: [:super_variants])
        @characters = @characters.as_json({include: [:normals, {specials: { include: :special_variants }}, {supers: { include: :super_variants }}, :assists]});
    end

    def variant_params
        params.require(:special_variant).permit(:input_type, :startup, :active, :recovery, :advantage, :immune_to, :meter_used, :gaurd, :properties, :special_notes, :picture) 
    end
end
