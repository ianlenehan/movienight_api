module Api::V1
  class UsersController < ApplicationController
    respond_to :json

    def index
      users = User.all
      render json: users
    end

    def show
      respond_with User.find(params[:id])
    end

    # fetch user details and groups for profile page
    def user_details
      user = User.find_by(access_token: params[:user][:access_token])
      groups = user.groups
      render json: { user: user, groups: groups }
    end

    def create
      user = User.new(user_params)
      # if the user is saved successfully than respond with json data and status code 201
      if user.save
        render json: user, status: 201
      else
        render json: { errors: user.errors }, status: 422
      end
    end

    def update
      user = User.find(params[:id])

      if user.update(user_params)
        render json: user, status: 200
      else
        render json: { errors: user.errors }, status: 422
      end
    end

    def destroy
      user = User.find(params[:id])
      user.destroy
      head 204
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end
