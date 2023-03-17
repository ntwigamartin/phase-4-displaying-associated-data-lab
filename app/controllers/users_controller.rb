class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

    def show
        user = User.find(params[:id])
        render json: user, include: :items
    end

    private

    def not_found_response
        render json: { error: 'User not found' }, status: :not_found
    end
end
