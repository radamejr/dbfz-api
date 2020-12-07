class Api::V1::UserTokenController < Knock::AuthTokenController
    skip_before_action :verify_authenticity_token, raise: false


    def create
        render json: {
            jwt: auth_token.token,
            user: User.select('email, username, id, admin').find(auth_token.payload[:sub])
        }, status: :ok
    end

end