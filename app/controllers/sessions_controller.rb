class SessionsController < ApplicationController
    def create
        @user = User.find_by(email: session_params[:email])

        if @user && @user.authenticate(session_params[:password])
            login!
            render json: {
                logged_in: true,
                status: 200,
                user: {
                    admin: @user.admin,
                    email: @user.email,
                    username: @user.username,
                    id: @user.id,
                }
            }
            response.set_header('Set-Cookie', 'Secure; SameSite=None')
    
        else
            render json: {
                status: 401,
                errors: ['no such user', 'verify credentials and try again']
            }
        end
    end

    def is_logged_in?
        if logged_in? && current_user
            render json: {
                logged_in: true,
                status: 200,
                user: {
                    admin: @user.admin,
                    email: @user.email,
                    username: @user.username,
                    id: @user.id,
                }
            }
        else
            render json: {
                logged_in: false,
                status: 401,
                message: 'no session found'
            }
        end
    end

    def destroy
        logout!
        render json: {
            status: 200,
            logged_out: true
        }
    end

    private

    def session_params
        params.require(:user).permit(:username, :email, :password)
    end
end
