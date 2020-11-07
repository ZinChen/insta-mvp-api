class ApplicationController < ActionController::API
  class AuthorizationError < StandardError; end

  def current_user
    provided_token = request.authorization&.gsub(/\ABearer\s/, '')
    @current_user = User.find_by(authentication_token: provided_token)
  end
end
