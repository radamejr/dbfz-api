class Api::V1::UsersController < ApplicationController
    wrap_parameters :user, include: [:username, :email, :password, :password_confirmation]
    before_action :authenticate_user

    def index
        @users = User.all
        if @users
            render json: {
                users: @users
            }
        else
            render json: {
                status: 500,
                errors: ['no users found']
            }
        end
    end

    def create
        @user = User.new(new_user_params)
        if @user.save
            login!
            render json: {
                status: :created,
                user: @user
            }
        else render json: {
            status: 500,
            errors: @user.errors.full_messages
            }
        end
    end

    def show
        @user = User.find(params[:id])
        if @user
            render json: {
                user: @user
            }
        else
            render json: {
                status: 500,
                errors: ['user not found']
            }
        end
    end

    def update
        if @user.update_attributes(user_params)
            render json: @user, status: :ok
        else
            render json: @user, status: :unprocessable_entity
        end  
    end
    
    def find
        @user = User.find_by(email: params[:user][:email])
        if @user
          render json: @user
        else
          @errors = @user.errors.full_messages
          render json: @errors
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation, :admin)
    end

    def new_user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def set_user
        @user = User.find_by(id: params[:id])
    end
end
