class Api::V1::UserTokenController < Knock::AuthTokenController
    protect_from_forgery with: :null_session
end