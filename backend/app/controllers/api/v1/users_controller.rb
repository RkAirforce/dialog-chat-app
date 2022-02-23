class Api::V1::UsersController < ApplicationController
  def show
    user = User.includes(:posts).find(params[:id])
    render json: user.as_json(include: [{ posts: { include: { user: {only: %w[image name] } } }}])
  end
end
