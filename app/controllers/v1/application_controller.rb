module V1
  class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    before_action :ensure_json_request

    # TOKEN
    # include ActionController::HttpAuthentication::Token::ControllerMethods
    # TOKEN = 'mysecretK3y'

    private

    # def authenticate
    #   authenticate_token
    # end
    #
    # def authenticate_token
    #   authenticate_or_request_with_http_token do |token, options|
    #     # ActiveSupport::SecurityUtils.secure_compare(
    #     #   ::Digest::SHA256.hexdigest(token),
    #     #   ::Digest::SHA256.hexdigest(TOKEN)
    #     # )
    #     JWT.decode token, TOKEN, true, { algorithm: 'HS256' }
    #   end
    # end

    def ensure_json_request
      return if request.headers['Accept'] =~ /vnd\.api\+json/
      render nothing: true, status: :not_acceptable
    end
  end
end
