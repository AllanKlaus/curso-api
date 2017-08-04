module V1
  class AuthsController < ApplicationController
    skip_before_action :authenticate, only: :create

    def create
      payload = { name: params[:name], exp: Time.now.to_i + 30 }
      token = JWT.encode payload, TOKEN, 'HS256'

      render json: { token: token }
    end
  end
end
