class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all, each_serializer: UserSerializer
  end

  def show_by_username
    user = User.find_by!(username: params[:username])
    render json: UserSerializer.new(user)
  end
end
