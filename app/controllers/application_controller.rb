class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include Knock::Authenticable
  
  private

  def logged_in?
    !!current_user
  end

  def authenticate_v1_user
    authenticate_for Api::V1::User
  end

end